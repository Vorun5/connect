export const removePasswordHashFromUser = (user) => {
    const {passwordHash, ...userData} = user;
    return userData;
}

export const removePasswordHashFromUsers = (users) => {
    let newUsers = [];
    for (const user of users) {
        newUsers.push(removePasswordHashFromUser(user._doc));
    }
    return newUsers;
}
