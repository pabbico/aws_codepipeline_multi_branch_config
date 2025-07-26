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
