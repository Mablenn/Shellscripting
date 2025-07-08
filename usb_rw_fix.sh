#!/bin/bash
echo "Buscando dispositivos USB..."
lsblk -o NAME,SIZE,RO,TYPE,MOUNTPOINT | grep -E 'disk|part'

read -p "Introduce el nombre del dispositivo USB (ejem. sdb1): " DEVICE
DEV_PATH="/dev/$DEVICE"

echo "Verificando si el dispositivo existe..."
if [ ! -b "$DEV_PATH" ]; then
  echo "Dispositivo no encontrado: $DEV_PATH"
  exit 1
fi

echo "Desmontando $DEV_PATH..."
sudo umount "$DEV_PATH"

echo "Intentando quitar atributo de solo lectura (hdparm)..."
sudo hdparm -r0 "/dev/${DEVICE%[0-9]}"

echo "Reparando sistema de archivos (fsck)..."
sudo fsck -r "$DEV_PATH"

echo "Volviendo a montar el dispositivo en modo lectura/escritura..."
sudo mount -o remount,rw "$DEV_PATH" || sudo mount "$DEV_PATH" /mnt

echo "Comprobando acceso de escritura..."
if sudo touch /mnt/test_write.txt 2>/dev/null; then
  echo "El USB ahora tiene permisos de escritura."
  sudo rm /mnt/test_write.txt
else
  echo "Error: No se pudo escribir. El USB podría estar dañado o permanentemente protegido."
fi

echo "Desmontando..."
sudo umount "$DEV_PATH"
echo "Proceso completado."

