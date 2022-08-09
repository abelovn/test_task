FROM ubuntu:18.04
COPY ./src /app
RUN apt-get update 
RUN apt-get install -y apt-transport-https
RUN apt-get install -y wget
RUN wget -O packages-microsoft-prod.deb "https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb"
RUN apt-get update && dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y dotnet-sdk-6.0=6.0.100-1 
#ENTRYPOINT while true; do sleep 1; done
ENTRYPOINT ["dotnet", "run", "--project"]
CMD ["app"]
