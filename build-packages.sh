npx react-native bundle --platform ios --config metro.config.js --dev true --entry-file index.js --bundle-output bundle/main.ios.jsbundle --assets-dest bundle/ --reset-cache
npx react-native bundle --platform ios --config metro.common.config.js --dev true --entry-file common.js --bundle-output bundle/common.ios.jsbundle --assets-dest bundle/
npx react-native bundle --platform ios --config metro.business.config.js --dev true --entry-file index.js --bundle-output bundle/business.ios.jsbundle --assets-dest bundle/
npx react-native bundle --platform ios --config metro.business.config.js --dev true --entry-file index_business2.js --bundle-output bundle/business2.ios.jsbundle  --assets-dest bundle/