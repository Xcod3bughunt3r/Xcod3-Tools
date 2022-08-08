FROM php:7.4-cli
FROM php:8.1.3-cli
RUN apt update && apt install git -y
RUN git clone https://github.com/Xcod3bughunt3r/Xcod3-RedHawk.git && cp -r Xcod3-RedHawk /opt/redhawk
WORKDIR /opt/redhawk
CMD [ "php", "./redhawk.php", "<<<","$'fix'" ]
CMD [ "php", "./redhawk.php", "<<<","$'update'" ]
CMD [ "php", "./redhawk.php" ]
