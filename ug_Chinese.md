# RISCV-DV使用指南

## 环境搭建
1. 下载RISCV-DV代码
```bash
git clone https://github.com/IntelLabs/riscv-dv.git
cd riscv-dv
```
2. 安装Python依赖包
```bash
pip3 install -r requirements.txt # install dependencies (only once)
python3 run.py --help # check everything is ready
```
3. 安装RISCV-GCC \
推荐安装[riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain), 然后设置如下环境变量。
```bash
export RISCV_TOOLCHAIN=<riscv_gcc_install_path>
export RISCV_GCC="$RISCV_TOOLCHAIN/bin/riscv32-unknown-elf-gcc"
export RISCV_OBJCOPY="$RISCV_TOOLCHAIN/bin/riscv32-unknown-elf-objcopy"
```

4. 安装Spike \
参考[riscv-isa-sim](https://github.com/riscv-software-src/riscv-isa-sim)安装， configure时加入生成commit log的选项：
```bash
apt-get install device-tree-compiler
mkdir build
cd build
../configure --enable-commitlog
make
```
然后设置如下环境变量。
```bash
export SPIKE_PATH=$RISCV_TOOLCHAIN/bin
```

5. 安装Synopsys VCS

## 使用说明
### 产生测试例
#### 产生RV64GC的程序
根据`target/rv64gc/testlist.yaml`选择测试类型，比如我们选择M mode随机测试`riscv_machine_mode_rand_test`。在`riscv-dv`目录下输入如下命令：
```bash
python3 run.py --simulator vcs --target rv64gc --test riscv_machine_mode_rand_test
```
运行结束后，产生测试例的汇编文件位于目录`out_2023-mm-dd/asm_test/`, 对应Spike的commit log位于目录`out_2023-xx-xx/spike_sim/`。

#### 产生支持Difftest trap退出机制的测试例
还以`riscv_machine_mode_rand_test`为例，在`riscv-dv`目录下输入如下命令：
```bash
python3 run.py --simulator vcs --target rv64gc --step gen,gcc_compile --test riscv_machine_mode_rand_test --gcc_opts='-DDIFFTEST'
```
同样的，运行结束后，产生测试例的汇编文件位于目录`out_2023-mm-dd/asm_test/`, 不过不会产生Spike commit log。

#### 产生含RVV1.0指令的程序
根据`target/rv64gcv/testlist.yaml`选择测试类型，目前支持的类型包括:
- `riscv_vector_arithmetic_test`(向量运算指令，不包括向量load、store)
- `riscv_vector_load_store_test` (包括向量load、store)
与产生标量程序类似，产生向量程序的命令如下：
```bash
# support generating Spike commit log
python3 run.py --simulator vcs --target rv64gcv --test riscv_vector_arithmetic_test
python3 run.py --simulator vcs --target rv64gcv --test riscv_vector_load_store_test

# support Difftest
python3 run.py --simulator vcs --target rv64gcv --step gen,gcc_compile --test riscv_vector_arithmetic_test --gcc_opts='-DDIFFTEST'
python3 run.py --simulator vcs --target rv64gcv --step gen,gcc_compile --test riscv_vector_load_store_test --gcc_opts='-DDIFFTEST'
```
产生的文件位置同上，在`out_2023-mm-dd/asm_test/`和`out_2023-xx-xx/spike_sim/`。

#### 设置产生测试例的参数
比如RV64GCV，可以在`target/rv64gcv/testlist.yaml`中设置
- 指令数量
- 子程序数量
- 有无浮点
- 有无vector扩展指令
- 是否启用地址转换
- 是否有branch指令
- 是否有csr指令
- RVV指令所占比例 \
等等


#### 设置不支持的指令
在`target/rv64gc/riscv_core_setting.sv:30`的变量`unsupported_instr`中填入不支持的指令。这些指令就不会出现在测试例里面。\
能填入的指令名称是在`src/riscv_instr_pkg.sv`的`riscv_instr_name_t`中定义的。

#### 随机种子
如果不通过`--seed`设置随机种子，程序会自己产生随机种子，这个信息会被放在`out_2023-mm-dd/seed.yaml`中。
如果需要用相同的随机种子复现测试例，可以用选项`--seed_yaml <path-to-seed.yaml>`。

### 功能覆盖率统计
RISCV-DV支持用基于Spike commit log的离线统计功能覆盖率，使用如下命令：
```bash
python3 cov.py --target rv64gcv --dir out_2023-mm-dd
```
其中`--dir`指向之前测试例生成时产生的目录，cov.py会搜索其中的Spike commit log，用来统计覆盖率。

*目前RVV相关的功能覆盖率还在开发中。*

