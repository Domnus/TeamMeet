import { StyleSheet, Text, View } from "react-native"
import { IconButton } from "react-native-paper";
import { HeaderProps } from "../models/HeaderBar";

export function HeaderBar({ title, onPressed }: HeaderProps) {
	return (
		<View style={styles.headerView}>
			<Text style={styles.textStyle}>{title}</Text>
				<IconButton icon="arrow-left" color="white" size={28} onPress={onPressed}/>
		</View>
	)
}

const styles = StyleSheet.create({
	headerView: {
		flexDirection: 'row',
		flexWrap: 'wrap',
		alignItems: 'center',
		justifyContent: 'space-between',
		width: '100%',
		padding: 8,
	},
	textStyle: {
		fontSize: 28,
		fontFamily: 'Quicksand',
		color: 'white'
	}
})