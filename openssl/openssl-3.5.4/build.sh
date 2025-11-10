#!/bin/bash
set -e

# ================================
# 配置部分
# ================================
OPENSSL_VER=3.5.4
SRC_DIR=/home/cyg/mqtt_x86/mqtt.client/openssl/openssl-${OPENSSL_VER}
INSTALL_DIR=/usr/local/openssl-x86
BUILD_LOG=build_openssl.log

echo "=========================================="
echo "  Building OpenSSL ${OPENSSL_VER} for x86"
echo "  Source:  ${SRC_DIR}"
echo "  Install: ${INSTALL_DIR}"
echo "=========================================="

# ================================
# 检查目录
# ================================
if [ ! -d "$SRC_DIR" ]; then
    echo "❌ 源码目录不存在: $SRC_DIR"
    exit 1
fi

cd "$SRC_DIR"

# ================================
# 清理旧的构建
# ================================
echo "🧹 Cleaning old build..."
make clean > /dev/null 2>&1 || true

# ================================
# 配置编译选项
# ================================
echo "⚙️ Configuring..."
./Configure \
    linux-x86_64 \
    no-shared \
    no-tests \
    --prefix=${INSTALL_DIR} \
    --openssldir=${INSTALL_DIR}/ssl | tee ${BUILD_LOG}

# ================================
# 编译与安装
# ================================
echo "🚧 Building..."
make -j$(nproc) | tee -a ${BUILD_LOG}

echo "📦 Installing..."
sudo make install | tee -a ${BUILD_LOG}

echo "✅ OpenSSL ${OPENSSL_VER} built and installed successfully!"
echo "📍 Installed to: ${INSTALL_DIR}"

