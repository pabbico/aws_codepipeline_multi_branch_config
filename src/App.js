<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>IQLearner App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>root@ip-172-31-43-3:~/aws_codepipeline_multi_branch_config# cat src/App.js
import React from 'react';

function App() {
  const env = process.env.REACT_APP_ENV || "unknown";

  return (
    <div style={{ textAlign: 'center', marginTop: '100px' }}>
      <h1>Welcome to Pawan's Demo for AWS CodePipeline</h1>
      <h2>Current Environment: <span style={{ color: 'blue' }}>{env}</span></h2>
    </div>
  );
}

export default App;
