Package( "os" );

function tar(){
	local FileName=$1
    local DirName=$2
    cd ${cur_dir}/src
    [[ -d "${DirName}" ]] && rm -rf ${DirName}
    echo "Uncompress ${FileName}..."
    tar jxf ${FileName}
    echo "cd ${DirName}..."
    cd ${DirName}
}