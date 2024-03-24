import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter } from 'react-router-dom'
import App from './App'

import './styles/index.css'

window.staticRoot = window.staticRoot || ""

ReactDOM.render(<BrowserRouter><App /></BrowserRouter>, document.getElementById('root'))
