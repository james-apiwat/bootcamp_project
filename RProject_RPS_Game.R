rproject <- function() {
  
  print("Which mode do you prefer to play?")
  print("Type 1 for single player and 2 for multiplayer")
  print("And if you want to quit, type Q")
  
  i <- 0
  c <- 0
  w1 <- 0
  w2 <- 0
  l <- 0
  d <- 0
  rps <- c("R", "P", "S")
  
  while (i >= 0) {
    mode <- toupper(readLines("stdin", 1))
    i <- i + 1
    if (mode == 1) {
      print("Single Player START!!!")
      while (T) {
        print("Select one from R/P/S")
        p <- toupper(readLines("stdin",1))
        bot <- sample(rps,size=1)
        
        if (p == bot) {
          print(paste("Com: ", bot))
          print("Tie")
          c <- c + 1
          d <- d + 1
        } else if (p == "R") {
          if (bot == "P") {
            print(paste("Com:", bot))
            print("You Loss!")
            c <- c + 1
            l <- l + 1
          } else if (bot == "S") {
            print(paste("Com: ", bot))
            print("You Win!")
            c <- c + 1
            w1 <- w1 + 1 
          }
        } else if (p == "P") {
          if (bot == "R") {
            print(paste("Com:", bot))
            print("You Win!")
            c <- c + 1
            w1 <- w1 + 1
          } else if (bot == "S") {
            print(paste("Com:", bot))
            print("You Loss!")
            c <- c + 1
            l <- l + 1 
          }
        } else if (p == "S") {
          if (bot == "R") {
            print(paste("Com:", bot))
            print("You Loss!")
            c <- c + 1
            l <- l + 1
          } else if (bot == "P") {
            print(paste("Com:", bot))
            print("You Win!")
            c <- c + 1
            w1 <- w1 + 1
          }
        } else if (p == "Q") {
          print(paste("Total", c, "game."))
          print(paste(w1, "win", d, "tie", l, "loss"))
          print("Hope to see you again")
          break
        } else {
          print("Just R P or S,")
          print("And Q for quit")
        }
      }
      break
    } else if (mode == 2) {
      print("Multiplayer START!!!")
      
      while (T) {
        print("Player1 (select one from R/P/S)")
        p1 <- toupper(readLines("stdin",1))
        
        if (p1 == "Q") {
          print(paste("Total", c, "games, tie", d, "games."))
          print(paste("Player1:", w1, "win"))
          print(paste("Player2:", w2, "win"))
          print("Hope to see you guys again!")
          break
        } else if (p1 != "R" & p1 != "P" & p1 != "S")
          print("Just R P or S")
        else {
          print("Player2 (select one from R/P/S)")
          p2 <- toupper(readLines("stdin",1))
          if (p2 == "Q") {
            print(paste("Total", c, "games, draw", d, "games."))
            print(paste("Player1:", w1, "win"))
            print(paste("Player2:", w2, "win"))
            print("Hope to see you guys again!")
            break
          } else {
            if (p2 != "R" & p2 != "P" & p2 != "S")
              print("Just R P or S")          
            else if (p1 == p2) {
              print("Tie")
              c <- c + 1
              d <- d + 1
            } else if (p1 == "R") {
              if (p2 == "P") {
                print("Player2 Win!")
                c <- c + 1
                w2 <- w2 + 1
              } else if (p2 == "S") {
                print("Player1 Win!")
                c <- c + 1
                w1 <- w1 + 1
              }  
            } else if (p1 == "P") {
              if (p2 == "R") {
                print("Player1 Win!")
                c <- c + 1
                w1 <- w1 + 1
              } else if (p2 == "S") {
                print("Player2 Win!")
                c  <- c + 1
                w2 <- w2 + 1
              }
            } else if (p1 == "S") {
              if (p2 == "R") {
                print("Player2 Win!")
                c <- c + 1
                w2 <- w2 + 1
              } else if (p2 == "P") {
                print("Player1 Win!")
                c <- c + 1
                w1 <- w1 + 1
              }            
            } else {
              print("Just R P or S,")
              print("And Q for quit")
            }
          }
        }
      }
      break
    } else if (mode == "Q") {
      print("Hope to see you again!")
      break
    } else if (i == 3) {
      print("You better run again")
      break
    } else {
      print("Just 1 or 2 for playing,")
      print("And Q for quit")
    }
  }
}

rproject()