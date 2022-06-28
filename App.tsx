import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { Dimensions, StyleSheet } from 'react-native';
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import { useFonts, Quicksand_400Regular as Quicksand,Quicksand_500Medium as QuicksandMedium, Quicksand_600SemiBold as QuicksandSemiBold,Quicksand_700Bold as QuicksandBold } from '@expo-google-fonts/quicksand'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import Login from './src/pages/Login';
import Cadastro from './src/pages/Cadastro';

const Stack = createNativeStackNavigator()

function App() {
  return (
    <Stack.Navigator screenOptions={{headerShown: false}}>
      <Stack.Screen name='Login' component={Login}/>
      <Stack.Screen name="Cadastro" component={Cadastro}/>
    </Stack.Navigator>
  )
}

export default function Root() {
  let [fontsLoaded] = useFonts({
    Quicksand, QuicksandMedium, QuicksandSemiBold, QuicksandBold
  })

    if (!fontsLoaded) {
      return null
    }

	return (
		<NavigationContainer>
      <SafeAreaProvider>
        <SafeAreaView style={styles.container}>
          <StatusBar style="auto" />
          <App />
        </SafeAreaView>
      </SafeAreaProvider>
    </NavigationContainer>
	)
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#810FCC',
  }
})