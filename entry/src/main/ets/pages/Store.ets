import { User } from '../viewmodel/pojo/User'

class Store {
  private state: {
    token: string;
    user: User
  };

  constructor() {
    this.state = {
      token: '',
      user: {
        UserId: '',
        UserName: '',
        UserEmail: '',
        Password: '',
        UserImage: $r('app.media.p_user')
      }
    };
  }

  getToken() {
    return this.state.token;
  }

  getUser() {
    return this.state.user;
  }

  setToken(newToken : string) {
    this.state.token = newToken;
  }

  setUser(newUser : User) {
    this.state.user = newUser;
  }
}

const store = new Store();
export default store;