echo "Attempting to convert a key $1 to another formated key $2"
openssl pkcs8 -topk8 -inform PEM -outform PEM -in $1 -out $2 -nocrypt