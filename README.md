# react-native-blurred-text

text view for displaying text with blur filter

## Installation

```sh
npm install react-native-blurred-text
```

## Usage

```js
import {StyleSheet} from 'react-native';
import BlurredText from "react-native-blurred-text";

const BlurredText =  () => {

  return (
    <RNBlurredText
        value={'This text will be displayed blurry'}
        fontSize={20}
        blurr={4}
        color={"rgb(20,200,220)"}
        style={styles.textStyle}
    />
  )
}

const styles = StyleSheet.create({
  textStyle: {
    width: '100%',
    height: 100,
  },
});

export default BlurredText;
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
