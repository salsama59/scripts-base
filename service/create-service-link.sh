echo "Begin link creation to init.d"
while getopts s:d: flag
do
    case "${flag}" in
        s) sourceFilePath=${OPTARG};;
        d) destinationLinkName=${OPTARG};;
    esac
done

echo "attempting to create the link name : $destinationLinkName from the file $sourceFilePath"
sudo ln -sf $sourceFilePath /etc/int.d/$destinationLinkName