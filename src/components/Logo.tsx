import { ImageBackground } from "react-native";

type CustomProps = {
   viewStyle?: {},
   imageStyle?: {}
};

export function Logo({viewStyle, imageStyle} : CustomProps) {
	return (
		<ImageBackground source={require('../../assets/logo.png')} style={viewStyle} imageStyle={imageStyle}/>
	)
}