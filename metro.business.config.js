// metro.common.config.js

const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');
const { hasBuildInfo, getCacheFile, isPwdFile } = require("./build");

const bundleBuInfo = require("./config/bundleBuInfo.json");
function postProcessModulesFilter(module) {
  if (
    module["path"].indexOf("__prelude__") >= 0 ||
    module["path"].indexOf("polyfills") >= 0
  ) {
    return false;
  }

  if (hasBuildInfo("./config/bundleCommonInfo.json", module.path)) {
    return false;
  }

  return true;
}

function createModuleIdFactory() {
    // module id 要用 number,如用string在dev环境会报错，及在生产环境会break down
    // 如果是业务 模块以 10000000 来自增命名
    const fileToIdMap = new Map();
    let nextId = 10000000;
    let isFirst = false;
    
    return (path) => {
        if (Boolean(getCacheFile("./config/bundleCommonInfo.json", path))) {
          return getCacheFile("./config/bundleCommonInfo.json", path);
        }
    
        if (!isFirst && isPwdFile(path)) {
          nextId = bundleBuInfo[isPwdFile(path)];
          isFirst = true;
        }
    
        let id = fileToIdMap.get(path);
        if (typeof id !== "number") {
          id = nextId++;
          fileToIdMap.set(path, id);
        }
        return id;
      };
  }

module.exports = function (baseConfig) {
  const defaultConfig = mergeConfig(baseConfig, getDefaultConfig(__dirname));
  const {resolver: {assetExts, sourceExts}} = defaultConfig;

  return mergeConfig(
    defaultConfig,
    {
        transformer: {
            getTransformOptions: async () => ({
            transform: {
                experimentalImportSupport: false,
                inlineRequires: true,
            },
            }),
        },

        serializer: {
            processModuleFilter: postProcessModulesFilter,  // 过滤基础包的内容
            createModuleIdFactory: createModuleIdFactory,   // 给Module id,以自增的形式 
        },
        
        resolver: {
            assetExts: assetExts.filter(ext => ext !== 'svg'),
            sourceExts: [...sourceExts, 'svg'],
        },
    },
  );
};