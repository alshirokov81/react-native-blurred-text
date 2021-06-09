import React, {Node, useState} from 'react';

import {
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  Platform,
  TextInput,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';

import RNBlurredText from "react-native-blurred-text";

const App: () => Node = () => {
  const [blurredTextVal, setBluttedTextVal] = useState('this text should be blurr');
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };
  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <Text style={{margin: 20, alignItems: 'center', justifyContent: 'center', fontSize: 20}}>Testing blurred text in {Platform.OS}</Text>
        <RNBlurredText
          value={blurredTextVal}
          blurr={25}
          style={styles.textStyle}
        />

      <Text style={{marginHorizontal: 20, alignItems: 'center', justifyContent: 'center', fontSize: 15}}>type text for blurr here</Text>
      <TextInput
        style={styles.inputStyle}
        value={blurredTextVal}
        onChangeText={setBluttedTextVal}
        placeholder="type text for blurr here"
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  textStyle: {
    width: '100%',
    height: 100,
    fontSize: 25,
    fontFamily: 'Cochin',
    color: 'blue'
  },
  inputStyle: {
    marginHorizontal: 20,
    width: '80%',
    height: 60,
    borderBottomWidth: 1
  },
});

export default App;
