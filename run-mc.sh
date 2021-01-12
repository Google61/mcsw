customjar=fabric-server-launch.jar

cd server
echo "eula=true">eula.txt
if test -f "$customjar";
then
  jar="$customjar"
else
  jar=server.jar
fi
java -Xmx1024M -Xms1024M -jar "$jar" nogui
