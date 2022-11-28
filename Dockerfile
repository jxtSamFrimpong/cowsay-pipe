FROM minddocdev/node-alpine
RUN mkdir /app
RUN mkdir /app/cowsay
WORKDIR /app
COPY cowsay cowsay
# RUN apt install unzip -y
# RUN unzip /app/cowsay.zip
RUN rm /app/cowsay/src/package-lock.json
WORKDIR /app/cowsay/src/
RUN npm install
#COPY entry-point.sh /app/cowsay/src
#EXPOSE 3001
#CMD ["bash"]
CMD [ "sh", "entry-point.sh" ]
#CMD PORT=8080 node index.js
#use the command below to run on port 4001 on host machine
#docker run -dp 4001:3001 --name=onelove cowsay:2