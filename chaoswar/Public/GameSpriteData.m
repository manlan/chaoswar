#import "GameSpriteData.h"
#import "cocos2d.h"
#import "DataController.h"
#import "GameController.h"

float getArrowTower1AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level == 3)
    {
        return 1.1;
    }
	else
    {
        return 1.4;
    }
}

float getArrowTower2AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level == 3)
    {
        return 0.8;
    }
	else
    {
        return 1;
    }
}

float getArrowTower3AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level == 3)
    {
        return 0.65;
    }
	else
    {
        return 0.8;
    }
}

float getArrowTower1Attact()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level >= 2)
    {
        return 6;
    }
	else
    {
        return 5;
    }
}

float getArrowTower2Attact()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level >= 2)
    {
        return 10;
    }
	else
    {
        return 8;
    }
}

float getArrowTower3Attact()
{	
    int level = [DataController getUpdataLevelByTagName:4];
    if(level >= 2)
    {
        return 15;
    }
	else
    {
        return 12;
    }
}

float getDefenceTower1AttactTime()
{	
    return 4;
    int level = [DataController getUpdataLevelByTagName:5];
    if(level >= 2)
    {
        return 8;
    }
	else
    {
        return 9;
    }
}

float getDefenceTower2AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:5];
    if(level >= 2)
    {
        return 7;
    }
	else
    {
        return 8;
    }
}

float getDefenceTower3AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:5];
    if(level >= 2)
    {
        return 6;
    }
	else
    {
        return 7;
    }
}

float getDefenceTower1HP()
{	
    int level = [DataController getUpdataLevelByTagName:5];
    if(level == 3)
    {
        return 60;
    }
	else
    {
        return 40;
    }
}

float getDefenceTower2HP()
{	
    int level = [DataController getUpdataLevelByTagName:5];
    if(level == 3)
    {
        return 100;
    }
	else
    {
        return 70;
    }
}

float getDefenceTower3HP()
{	
    int level = [DataController getUpdataLevelByTagName:5];
    if(level == 3)
    {
        return 150;
    }
	else
    {
        return 100;
    }
}

float getTurrettower1Attact()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level >= 2)
    {
        return 15;
    }
	else
    {
        return 12;
    }
}

float getTurrettower2Attact()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level >= 2)
    {
        return 22;
    }
	else
    {
        return 18;
    }
}

float getTurrettower3Attact()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level >= 2)
    {
        return 33;
    }
	else
    {
        return 28;
    }
}

float getTurrettower1AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level == 3)
    {
        return 2.2;
    }
	else
    {
        return 2.4;
    }
}

float getTurrettower2AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level == 3)
    {
        return 2;
    }
	else
    {
        return 2.2;
    }
}

float getTurrettower3AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:6];
    if(level == 3)
    {
        return 1.9;
    }
	else
    {
        return 2;
    }
}

float getMagicTower1AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level == 3)
    {
        return 2;
    }
	else
    {
        return 2.1;
    }
}

float getMagicTower2AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level == 3)
    {
        return 1.9;
    }
	else
    {
        return 2;
    }
}

float getMagicTower3AttactTime()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level == 3)
    {
        return 1.8;
    }
	else
    {
        return 1.9;
    }
}

float getMagicTower1Attact()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level >= 2)
    {
        return 25;
    }
	else
    {
        return 20;
    }
}

float getMagicTower2Attact()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level >= 2)
    {
        return 35;
    }
	else
    {
        return 30;
    }
}

float getMagicTower3Attact()
{	
    int level = [DataController getUpdataLevelByTagName:7];
    if(level >= 2)
    {
        return 45;
    }
	else
    {
        return 40;
    }
}

float getMFLAttact()
{	
    return 9000;
    int level = [DataController getUpdataLevelByTagName:0];
    if(level >= 2)
    {
        return 100;
    }
	else
    {
        return 60;
    }
}

int getMFLLevel()
{
    int level = [DataController getUpdataLevelByTagName:0];
    return  level;
}

float getMCFireAttact()
{	
    return 5;
    int level = [DataController getUpdataLevelByTagName:1];
    if(level >= 2)
    {
        return 25;
    }
	else
    {
        return 15;
    }
}

int getMCFireLevel()
{
    int level = [DataController getUpdataLevelByTagName:1];
    return  level;
}

float getMCLightAttact()
{	
    return 5;
    int level = [DataController getUpdataLevelByTagName:2];
    if(level == 1)
    {
        return 100;
    }
	else if(level == 2)
    {
        return 150;
    }
    else
    {
        return 250;
    }
}

float getMCStoneAttact()
{	
    return 1;
    int level = [DataController getUpdataLevelByTagName:3];
    if(level >= 2)
    {
        return 60;
    }
	else
    {
        return 30;
    }
}

float getMCStoneFanitTime()
{	
    int level = [DataController getUpdataLevelByTagName:3];
    if(level == 3)
    {
        return 4;
    }
	else
    {
        return 2;
    }
}

ccColor3B getHintFontColor()
{
    GameController *gc = [GameController getGameController];
    switch (gc.mapType) {
		case MT_GREEN:
            return ccc3(255,255,255);
            break;
        case MT_SAND:
            return ccc3(255,204,  0);
			break;
        case MT_SNOW:
            return ccc3(255,204,  0);
			break;
		default:
            return ccc3(255,255,255);
			break;
	}
}

NSString* getEmptyName()
{
    GameController *gc = [GameController getGameController];
    switch (gc.mapType) {
		case MT_GREEN:
            return @"et01.png";
            break;
        case MT_SAND:
            return @"et03.png";
			break;
        case MT_SNOW:
            return @"et02.png";
			break;
		default:
            return @"et01.png";
			break;
	}
}
