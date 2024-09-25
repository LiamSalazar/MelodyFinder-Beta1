<html lang="es">
    <head>
        <title>Chat</title>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="Styles/Chat.css">
        
    </head>
    <body>
        <div class="page">
          <div class="marvel-device nexus5">
            <div class="screen">
              <div class="screen-container">
                <div class="status-bar">
                  <div class="time"></div>
                </div>
                <div class="chat">
                  <div class="chat-container">
                    <div class="user-bar">
                      <div class="back">
                        <i class="zmdi zmdi-arrow-left"></i>
                      </div>
                      <div class="avatar">
                          <img src="ImagenesChat/FotoPerfilNirvana.jpg" alt="Avatar">
                      </div>
                      <div class="name">
                        <span>Chat</span>
                        <span class="status">En l�nea</span>
                      </div>
                      <div class="actions more">
                        <i class="zmdi zmdi-more-vert"></i>
                      </div>
                      <div class="actions attachment">
                        <i class="zmdi zmdi-attachment-alt"></i>
                      </div>
                      <div class="actions">
                        <i class="zmdi zmdi-phone"></i>
                      </div>
                    </div>
                    <div class="conversation">
                      <div class="conversation-container">
                        
                      </div>
                      <form class="conversation-compose">
                        <div class="emoji">
                          </div>
			      <input class="input-msg" id="messageInput" name="input" placeholder="Escribe un mensaje" autocomplete="off" autofocus></input>
                        <div class="photo">
                          <i class="zmdi zmdi-camera"></i>
                        </div>
                        <button onclick="sendMessage()">
                            <div class="svg-wrapper-1">
                              <div class="svg-wrapper">
                                <svg
                                  xmlns="http://www.w3.org/2000/svg"
                                  viewBox="0 0 24 24"
                                  width="24"
                                  height="24"
                                  fill="#242526"
                                >
                                  <path fill="#242526" d="M0 0h24v24H0z"></path>
                                  <path
                                    fill="currentColor"
                                    d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
                                  ></path>
                                </svg>
                              </div>
                            </div>
                          </button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="scripts/Chat.js"></script>
    </body>
</html>
