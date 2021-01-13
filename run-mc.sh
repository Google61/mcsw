cd server
. ../setup-auto-mc.cfg
echo "eula=true">eula.txt
java -Xmx1024M -Xms1024M -jar "$jar" nogui
