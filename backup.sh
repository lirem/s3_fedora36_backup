#!/bin/bash

rsync -Pav /home/ll1rro/Education /home/ll1rro/Backup
rsync -Pav /home/ll1rro/Documents /home/ll1rro/Backup
rsync -Pav --exclude 'Screenshots' /home/ll1rro/Pictures /home/ll1rro/Backup
rsync -Pav /home/ll1rro/Work /home/ll1rro/Backup

aws s3 sync /home/ll1rro/Backup s3://ll1rro-forbackups/Backup
