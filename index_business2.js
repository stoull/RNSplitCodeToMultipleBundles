import { AppRegistry } from 'react-native';
import { StyleSheet, Text, SafeAreaView } from "react-native";

export default function App() {
    return (    
        <SafeAreaView style={styles.container}>
            <Text>Hi business2</Text>
        </SafeAreaView>
      );
}

const styles = StyleSheet.create({
    container: {
      backgroundColor: '#f2f4f6',
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
      width: '100%'
    }
})

console.log(`-------- business2 module did load -------->`)

AppRegistry.registerComponent("business2", () => App);