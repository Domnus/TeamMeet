import { View, StyleSheet, Text, TextInput, Pressable } from "react-native";
import { Button } from "../components/Button";
import { Logo } from "../components/Logo";

export function Login() {

	let onPressed = () => {
		console.log('hello')
	}

	return (
		<View style={styles.view}>
			<View style={styles.viewImage}><Logo viewStyle={styles.imageView} imageStyle={styles.imageStyle}/></View>

				<View style={styles.formView}>
					<Text style={styles.formText}>Email</Text>
					<TextInput style={styles.textInput} placeholder="roberto.seiti@gmail.com" placeholderTextColor={styles.placeholder.color}></TextInput>
					<Text style={styles.formText}>Senha</Text>
					<TextInput style={styles.textInput} placeholder='**************' placeholderTextColor={styles.placeholder.color}></TextInput>
				</View>

			<Button title='ENTRAR' onPressed={onPressed} buttonStyle={styles.buttonStyle} textStyle={styles.textButtonStyle}></Button>
		</View>
	)
}

const styles = StyleSheet.create({
	view: {
		flex: 1,
		flexDirection: 'column',
		justifyContent: 'space-between',
		width: '80%',
		margin: 40
	},
	viewImage: {
		alignItems: 'center'
	},
	imageView: {
		width: 122,
		height: 55,
	},
	imageStyle: {
		borderRadius: 5
	},
	text: {
		color: '#FFFFFF',
		fontSize: 24,
	},
	placeholder: {
		color: 'rgba(255, 255, 255, 0.8)'
	},
	formView: {
		flex: 1,
		flexDirection: 'column',
		justifyContent: 'center'
	},
	formText: {
		color: '#FFFFFF',
		fontSize: 24,
		marginTop: 20,
		fontFamily: 'QuicksandMedium'
	},
	textInput: {
		fontSize: 16,
		borderBottomWidth: 1,
		borderColor: 'white',
		padding: 5,
		color: 'white',
		marginTop: 20,
		fontFamily: 'QuicksandMedium'
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
	}
})