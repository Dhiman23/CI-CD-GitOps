# initializing base image for go app and base is a alias for next stage
FROM golang:1.22 as base
# creating work dir called app inside the containter 
WORKDIR /app
# copy go.mod file form the repo to container (its like pom.xml file)
COPY go.mod .
# running go mod install cmd to installing the dependencis from mod 
RUN go mod download
#  copying all the files/folders 
COPY . .
# running build command to thr application inside the container 
RUN go build -o main .
# this if the final stage to reduce size as well as increase the sercurity of the container
FROM gcr.io/distroless/base
# copy all the binaries from the stage base 
COPY --from=base /app/main .
# copy all the static file from the binares which is located in 1st stage
COPY --from=base /app/static ./static
# documenting the port in which docker container will run (note: line below noe use to open the port for the container , we use -p for port allocation at the time of running the container)
EXPOSE 8080
# using CMD command to run the application inside the container 
CMD [ "./main" ]
