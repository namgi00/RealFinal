'use strict';

var color = {
    pink: "color:#ff757c;font-size:11px;",
    green: "color:#0e7886;font-size:11px;"
};

function isUA(userAgent) {
    return navigator.userAgent.toLowerCase().indexOf(userAgent) > -1;
}

if (typeof console === "object" && console.log && typeof console.log === "function") {
    if (isUA('chrome') && !isUA('edge')) {
        console.log(
            `%c        _\n` +
            `%c       / \\         ___                    %c________                                       ___\n` +
            `%c      / _ \\       /  /   _____   __  __  %c|__    __| __  __                       ____   /  /\n` +
            `%c     / /_\\ \\      |  |  /  _  \\ |  |/  \\    %c|  |   |  |/  \\   _____  __     __  / __ \\  |  |\n` +
            `%c    /  ___  \\     |  | / /__\\ | |    /\\_\\   %c|  |   |    /\\_\\ /  _  | \\ \\   / / / /__\\ | |  |\n` +
            `%c   /  /   \\  \\    |  | | _____/ |  |/       %c|  |   |  |/     | | | |   \\ \\/ /  |  ____/ |  |\n` +
            `%c  /  /     \\  \\   |  | | (_____ |  |        %c|  |   |  |      | |_| |    \\  /   | (_____ |  |\n` +
            `%c /__/       \\__\\  /__/ \\______/ |__|        %c|__|   |__|      \\___,_|     \\/    \\______/ /__/\n`,
            color.pink,
            color.pink,color.green,
            color.pink,color.green,
            color.pink,color.green,
            color.pink,color.green,
            color.pink,color.green,
            color.pink,color.green,
            color.pink,color.green
        );
    } else {
console.log(
    "        _\n" +
    "       / \\        ___                    ________                                      ___\n" +
    "      / _ \\     /  /   _____   __  __  |__    __| __  __                      ____   /  /\n" +
    "     / /_\\ \\     |  |  /  _  \\ |  |/  \\    |  |   |  |/  \\   _____  __    __  / __ \\  |  |\n" +
    "    /  ___  \\     |  | / /__\\ | |    /\\_\\   |  |   |    /\\_\\ /  _  | \\ \\  / / / /__\\ | |  |\n" +
    "   /  /   \\  \\    |  | | _____/ |  |/       |  |   |  |/     | | | |  \\ \\/ /  |  ____/ |  |\n" +
    "  /  /     \\  \\   |  | | (_____ |  |        |  |   |  |      | |_| |   \\  /   | (_____ |  |\n" +
    " /__/       \\__\\ /__/ \\______/ |__|        |__|   |__|      \\___,_|    \\/    \\______/ /__/\n"
);
    }
    console.log("\x3e \x3e \x3e https://github.com/rekjeawon88/alertravel\n")
}
