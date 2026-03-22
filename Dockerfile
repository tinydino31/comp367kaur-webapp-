FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

COPY *.sln .
COPY comp367kaur-webapp/. ./comp367kaur-webapp/
RUN dotnet restore

RUN dotnet publish comp367kaur-webapp/comp367kaur-webapp.csproj -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /out .
EXPOSE 8080
ENTRYPOINT ["dotnet", "comp367kaur-webapp.dll"]
