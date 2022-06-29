import { useState } from "react";
import { View, StyleSheet, Text, TextInput, Pressable, ScrollView, Dimensions } from "react-native";
import Button from "../components/Button";
import Logo from "../components/Logo";
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';
import { RootStackParamsList } from "../models/RootStackParamsList";
import type { NativeStackScreenProps } from '@react-navigation/native-stack';

const win = Dimensions.get('window')
const ratio = win.width / 248
const height = win.height;

export default function Login({ navigation } : NativeStackScreenProps<RootStackParamsList, 'Login'>) {
	const [passwordVisible, setPasswordVisible] = useState(false)
	const [password, setPassword] = useState('')
	const [email, setEmail] = useState('')

	function updatePassword() {
		setPasswordVisible(!passwordVisible)
	}

	let onPressed = () => {
		console.log('hello')
	}

	return (
		<ScrollView>
			<View style={styles.view}>
				<View style={styles.viewImage}><Logo viewStyle={styles.imageView} imageStyle={styles.imageStyle}/></View>
					<View style={styles.formView}>
						<Text style={styles.formText}>Email</Text>
						<TextInput
							style={styles.textEmailInput}
							placeholder="roberto.seiti@gmail.com"
							placeholderTextColor={styles.placeholder.color}
							onChangeText={(text: string) => setEmail(text)}>
						</TextInput>

						<Text style={styles.formText}>Senha</Text>
						<View style={styles.formPasswordView}>
							<TextInput
								style={styles.textPasswordInput}
								placeholder='**************'
								placeholderTextColor={styles.placeholder.color}
								secureTextEntry={!passwordVisible}
								autoCorrect={false}
								onChangeText={(text: string) => setPassword(text)}>
							</TextInput>
							<Pressable onPress={updatePassword}>
								<Icon name={passwordVisible ? 'eye-off' : 'eye'} size={30} color='white'/>
							</Pressable>
						</View>
					</View>
				<Button title='ENTRAR' onPressed={onPressed} buttonStyle={styles.buttonStyle} textStyle={styles.textButtonStyle}></Button>
				<Text style={styles.textCadastro}>
					Não tem uma conta?
					<Text style={styles.textCadastroLink} onPress={() => navigation.navigate('Cadastro')}> Cadastre-se</Text>
				</Text>
			</View>
		</ScrollView>
	)
}

const styles = StyleSheet.create({
	view: {
		flex: 1,
		flexDirection: 'column',
		alignSelf: 'center',
		justifyContent: 'space-between',
		width: '100%',
		height: height,
		padding: '10%',
		backgroundColor: '#810FCC',
	},
	viewImage: {
		alignItems: 'center'
	},
	imageView: {
		height: 100,
		width: 129 * ratio, 
	},
	imageStyle: {
		borderRadius: 5,
		resizeMode: 'stretch'
	},
	placeholder: {
		color: 'rgba(255, 255, 255, 0.8)'
	},
	formView: {
		flex: 1,
		flexDirection: 'column',
		justifyContent: 'center'
	},
	formPasswordView: {
		flexDirection:'row',
		borderBottomWidth: 1,
		borderColor: 'white',
		alignItems: 'center'
	},
	formText: {
		color: '#FFFFFF',
		fontSize: 24,
		marginTop: 20,
		fontFamily: 'Quicksand'
	},
	textEmailInput: {
		fontSize: 16,
		borderBottomWidth: 1,
		borderColor: 'white',
		padding: 5,
		color: 'white',
		marginTop: 20,
		fontFamily: 'Quicksand'
	},
	textPasswordInput: {
		flexGrow: 1,
		fontSize: 16,
		alignItems: 'center',
		justifyContent: 'center',
		padding: 5,
		color: 'white',
		paddingTop: 20,
		fontFamily: 'Quicksand'
	},
	buttonStyle: {
		backgroundColor: 'white',
		borderRadius: 10,
		paddingVertical: 24,
		alignItems: 'center',
	},
	textButtonStyle: {
		fontSize: 24,
		color: '#810FCC',
		fontFamily: 'QuicksandSemiBold',
	},
	textCadastro: {
		alignSelf: 'center',
		color: 'white',
		paddingTop: 80,
		fontFamily: 'Quicksand'
	},
	textCadastroLink: {
		fontWeight: 'bold'
	}
})