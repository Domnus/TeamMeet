import React from "react";
import { View, Text, StyleSheet, Dimensions } from "react-native";
import { HeaderBar } from "../components/HeaderBar";
import { RootStackParamsList } from "../models/RootStackParamsList";
import type { NativeStackScreenProps } from '@react-navigation/native-stack';
import { IconButton } from "react-native-paper";

const win = Dimensions.get('window')
const buttonSize = 0.20

export default function Cadastro({ navigation }: NativeStackScreenProps<RootStackParamsList, 'Cadastro'>) {
	return (
		<View style={styles.mainView}>
			<HeaderBar title='Eu sou...' onPressed={() => { navigation.goBack() }} />

			<View style={styles.contentView}>
				<View style={styles.buttonView}>
					<IconButton style={styles.buttonStyle} icon="account" color="white" size={48} onPress={() => { console.log('Jogador') }} />

					<Text style={styles.buttonText}>Jogador</Text>
				</View>

				<View style={styles.buttonView}>
					<IconButton style={styles.buttonStyle} icon="briefcase" color="white" size={48} onPress={() => { console.log('Organização') }} />

					<Text style={styles.buttonText}>Organização</Text>
				</View>
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
		flexDirection: 'row',
		width: '100%',
		marginTop: win.height * 0.20,
		alignItems: 'center',
		justifyContent: 'space-evenly',
	},
	buttonStyle: {
		backgroundColor: "#B565EA",
		width: win.height * buttonSize,
		height: win.height * buttonSize,
		borderRadius: 100
	},
	buttonView: {
		flexDirection: 'column',
		alignItems: 'center',
		justifyContent: 'center',
	},
	buttonText: {
		color: 'white',
		fontSize: 24,
		fontFamily: 'QuicksandMedium'
	}
})