----ALL CREDITS TO SOL https://discord.gg/eB5Cnt8jAA
Config = {}

-- האם לבדוק תפקיד משטרה (true = רק משטרה, false = כולם)
Config.CheckPoliceJob = true

-- שם התפקיד של המשטרה (רלוונטי רק אם CheckPoliceJob = true)
Config.PoliceJobName = 'police'

-- רשימת תפקידי משטרה נוספים (אופציונלי)
Config.PoliceJobs = {
    'police',
    'sheriff',
}

-- רשימת כלי נשק שיקבלו רצועת אבטחה
Config.EnabledWeapons = {
    `weapon_stungun`,
    `WEAPON_PISTOL`,
    `weapon_g19switch`,
    `weapon_fnx45`,
    `WEAPON_G19XD`,
    `weapon_g17black`,
    `weapon_g17tan`,
}

-- עצמות מותאמות אישית לכלי נשק ספציפיים
Config.WeaponBones = {
    -- דוגמה: [`weapon_name`] = 'bone_name'
}
