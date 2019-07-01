#/bin/bash


aws s3 --region us-east-2 cp s3://jacekkowalczyk82.private.s3/my-debian-images/20190701/debian-live-ldd-xfce-amd64.hybrid.iso debian-live-ldd-xfce-amd64.hybrid.20190701.iso
sha256sum debian-live-ldd-xfce-amd64.hybrid.20190701.iso | tee -a debian-live-ldd-xfce-amd64.hybrid.20190701.iso.sha256sum.txt 


ssh -t jacekkowalczyk8@shell.sourceforge.net create


rsync -e ssh debian-live-ldd-xfce-amd64.hybrid.20190701.iso jacekkowalczyk8@frs.sourceforge.net:/home/frs/project/my-debian/live-buster-dwm-openbox-i3-xfce/
rsync -e ssh debian-live-ldd-xfce-amd64.hybrid.20190701.iso.sha256sum.txt jacekkowalczyk8@frs.sourceforge.net:/home/frs/project/my-debian/live-buster-dwm-openbox-i3-xfce/


