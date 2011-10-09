// 敌人种类
typedef enum {
	//FOOT步兵
	ET_FOOT1,  
	ET_FOOT2
	
} TEnemyType;

// 攻击类型
typedef enum {
	AT_NORMAL,
	AT_MAGIC
} TAcctactType;

// 防御类型
typedef enum {
	DT_NO,
	DT_MAGIC,
    DT_HIGH
} TDefenceType;

// 屏幕状态
typedef enum {
	SCT_ALL,
	SCT_ONLYWHITE,
    SCT_NOTWHITE,
	SCT_ALLSPRITE,
	SCT_TOWER,
	SCT_UNIT,
	SCT_ENEMY,
	SCT_FRIENDLY,
	SCT_NONE,
} TScreenClickType;

// 操作状态
typedef enum {
	OT_NORMAL,
	OT_MAGIC_FIRE,
	OT_MAGIC_FRIENDLY,
	OT_MAGIC_STOP,
	OT_MAGIC_THUNDER,
	OT_BUILDING,
	OT_SELL,
	OT_UPDATE,
	OT_NONE,
} TOperateType;