#!/bin/bash
set -e

# ====================================
# 配置信息
# ====================================
SRC_DIR=/home/cyg/mqtt_x86/mqtt.client/paho.mqtt.cpp
BUILD_DIR=${SRC_DIR}/build
INSTALL_DIR=/usr/local/paho-mqtt-cpp-x86
OPENSSL_DIR=/usr/local/openssl-x86

echo "=========================================="
echo "  Building Paho MQTT C++ (x86)"
echo "  Source:  ${SRC_DIR}"
echo "  Install: ${INSTALL_DIR}"
echo "  OpenSSL: ${OPENSSL_DIR}"
echo "=========================================="

# ====================================
# 检查路径
# ====================================
if [ ! -d "$SRC_DIR" ]; then
    echo "❌ 源码目录不存在: $SRC_DIR"
    exit 1
fi

if [ ! -d "$OPENSSL_DIR" ]; then
    echo "❌ OpenSSL 路径不存在: $OPENSSL_DIR"
    exit 1
fi

# ====================================
# 创建构建目录
# ====================================
mkdir -p $BUILD_DIR
cd $BUILD_DIR

# ====================================
# 配置 CMake
# ====================================
echo "⚙️ Configuring CMake..."
cmake -B. -S${SRC_DIR} \
    -DPAHO_WITH_SSL=TRUE \
    -DOPENSSL_ROOT_DIR=${OPENSSL_DIR} \
    -DPAHO_BUILD_STATIC=TRUE \
    -DPAHO_BUILD_SHARED=TRUE \
    -DPAHO_BUILD_SAMPLES=ON \
    -DPAHO_BUILD_DOCUMENTATION=OFF \
    -DPAHO_WITH_MQTT_C=ON \
    -DPAHO_MQTT_C_PATH=/usr/local/lib \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}

# ====================================
# 编译与安装
# ====================================
echo "🚧 Building..."
make -j$(nproc)

echo "📦 Installing..."
sudo make install

echo "✅ Build complete!"
echo "📍 Installed to: ${INSTALL_DIR}"

