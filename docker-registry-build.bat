@echo off
docker run -d -p 5000:5000 --restart always --name registry distribution/distribution:3
