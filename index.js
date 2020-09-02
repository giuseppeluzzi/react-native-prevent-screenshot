import { NativeModules } from 'react-native';

const { RNPreventScreenshot } = NativeModules;

export function usePreventScreenCapture() {
	useEffect(() => {
		RNPreventScreenshot.preventScreenCapture();
		return () => {
			RNPreventScreenshot.enableScreenCapture();
		};
	}, []);
}
