import React from "react";
import { View, Text, StyleSheet } from "react-native";
import { HeaderBar } from "../components/HeaderBar";
import { RootStackParamsList } from "../models/RootStackParamsList";
import type { NativeStackScreenProps } from '@react-navigation/native-stack';

export default function Cadastro({ navigation }: NativeStackScreenProps<RootStackParamsList, 'Cadastro'>) {
	return (
		<View style={styles.mainView}>
			<HeaderBar title='Eu sou...' onPressed={() => {navigation.goBack()}}/>
			<View style={styles.contentView}>
				<Text>Cadastro</Text>
			</View>
		</View>
	)
}

const styles = StyleSheet.create({
	mainView: {
		flex: 1,
		width: '100%',
		backgroundColor: '#810FCC'
	},
	contentView: {
		flex: 1,
		width: '100%',
		alignItems: 'center',
		justifyContent: 'center',
	}
})