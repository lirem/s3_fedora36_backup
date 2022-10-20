#!/bin/bash

#rsync -Pav /home/ll1rro/Education /home/ll1rro/Backup
#rsync -Pav /home/ll1rro/Documents /home/ll1rro/Backup
#rsync -Pav --exclude 'Screenshots' /home/ll1rro/Pictures /home/ll1rro/Backup
#rsync -Pav /home/ll1rro/Work /home/ll1rro/Backup

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo
echo -e "${GREEN}Sending all files from directories 'Education, Documents, Pictures and Work' to Backup directory${NC}"
echo
rsync -Pav --exclude 'Screenshots' --delete /home/ll1rro/Education /home/ll1rro/Documents /home/ll1rro/Pictures /home/ll1rro/Work /home/ll1rro/Backup

echo
echo
echo -e "${GREEN}Starting sync between your system and AWS S3 backet${NC}"
echo
/usr/local/bin/aws s3 sync --delete /home/ll1rro/Backup s3://ll1rro-forbackups/Backup
