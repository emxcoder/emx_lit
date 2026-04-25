import streamlit as st
import pandas as pd

st.set_page_config(page_title="EMX Lit Demo", layout="centered")

st.title("Welcome to EMX Lit")
st.write("This is a simple Streamlit page created for a quick demo.")

name = st.text_input("Enter your name:")
if st.button("Say hello"):
    if name:
        st.success(f"Hello, {name}!")
    else:
        st.error("Please enter your name.")

