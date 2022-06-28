import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet } from 'react-native';
import { Login } from './src/pages/Login';
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import { useFonts, Quicksand_500Medium as QuicksandMedium, Quicksand_600SemiBold as QuicksandSemiBold,Quicksand_700Bold as QuicksandBold } from '@expo-google-fonts/quicksand'

function App() {
  let [fontsLoaded] = useFonts({
    QuicksandMedium, QuicksandSemiBold, QuicksandBold
  })

    if (!fontsLoaded) {
      return null
    }

  return (
    <>
      <StatusBar style="auto" />
      <Login />
    </>
  )
}

export default function Root() {
	return (
		<SafeAreaProvider>
			<SafeAreaView style={styles.container}>
				<App />
			</SafeAreaView>
		</SafeAreaProvider>
	)
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#810FCC',
    alignItems: 'center',
    justifyContent: 'center',
  }
})