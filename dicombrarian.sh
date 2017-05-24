echo "Note: If there are folders which contain no hyphens, they will appear as errors, but can be ignored."

#go through each folder
for dir in */; do
    if [ -d "$dir"DICOM ]
    then
        echo "Current folder: $dir"
        #move contents of DICOM folder to root
        mv "$dir"DICOM/* "$dir"/
        #delete DICOM directory
        rm -r "$dir"DICOM
        #delete DICOMDIR file
        rm "$dir"DICOMDIR
    fi

    #replace hyphens with underscores
    mv $dir ${dir//-/_}
done

for petdir in *PET; do
    #delete PET in folder names
    mv "$petdir" "${petdir//_PET/}"
done