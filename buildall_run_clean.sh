cd "$(dirname ${BASH_SOURCE[0]})"
./build_base.sh
./build_builder.sh
./build_squeezelite.sh
./build_shairport.sh
./run.sh
./clean.sh

