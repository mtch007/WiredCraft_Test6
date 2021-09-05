FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 5000

ENV ASPNETCORE_URLS=http://+:5000

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["TestDockerApi/TestDockerApi.csproj", "TestDockerApi/"]
RUN dotnet restore "TestDockerApi\TestDockerApi.csproj"
COPY . .
WORKDIR "/src/TestDockerApi"
RUN dotnet build "TestDockerApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TestDockerApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TestDockerApi.dll"]
