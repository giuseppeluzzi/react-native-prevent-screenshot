import { useEffect } from "react";
import { NativeModules } from "react-native";

const { RNPreventScreenshot } = NativeModules;

export function usePreventScreenCapture() {
  useEffect(() => {
    RNPreventScreenshot.preventScreenCapture();
    return () => {
      RNPreventScreenshot.enableScreenCapture();
    };
  }, []);
}

export function preventScreenCapture() {
  RNPreventScreenshot.preventScreenCapture();
}

export function enableScreenCapture() {
  RNPreventScreenshot.preventScreenCapture();
}
