import React, { useState } from 'react';
import { View, Text, StyleSheet, FlatList, Alert } from 'react-native';
import Header from './components/Header';
import ListItem from './components/ListItem';
import AddItem from './components/AddItem';

const App = () => {
  const [items, setItems] = useState([
    { id: 1, text: 'Milk' },
    { id: 2, text: 'Eggs' },
    { id: 3, text: 'Bread' },
    { id: 4, text: 'Juice' }
  ]);

  const deleteItem = (id) => {
    setItems(items.filter(item => item.id !== id))
  };

  const addItemToList = (item) => {
    if (!item) {
      Alert.alert("Error", "Please enter an item", { text: "Ok" })
    }
    else {
      setItems([...items, { id: Math.floor(Math.random() * 10000), text: item }])
    }
  };

  return (
    <View style={styles.container}>
      <Header title='Shopping List' />
      <AddItem addItemToList={addItemToList} />
      <FlatList
        data={items}
        renderItem={({ item }) => <ListItem item={item} deleteItem={deleteItem} />}
      />
    </View>
  )
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 60
  }
});

export default App;