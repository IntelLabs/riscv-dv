#!/bin/bash

# ������������
base_dir="/tmpdata/project/riscv/sunjiawen"
cov_script="${base_dir}/riscv-dv/cov.py"
input_base_dir="${base_dir}/added_rios_stage1_3/log_file/"
output_base_dir="/tmpdata/project/riscv/sunjiawen/added_rios_stage1_3/cov_file/"

# ��������folder_X������������
cd "${input_base_dir}"
# declare -a folders=("folder_3" "folder_5" )

# for folder in "${folders[@]}"; do
# ��������������folder_X������
for folder in folder_*; do
  if [[ -d "$folder" ]]; then  # ��������������
    # ������������������������
    input_dir="${input_base_dir}/${folder}"
    output_dir="${output_base_dir}/${folder}"

    # ����������������������������
    mkdir -p "${output_dir}"

    # ����cov.py����
    python3 "${cov_script}" --target rv64gcv --dir "${input_dir}" --output "${output_dir}"

    # ����������������
    echo "Completed coverage for ${folder}"
  fi
done

# ������������������������
echo "All folders have been processed for coverage."
