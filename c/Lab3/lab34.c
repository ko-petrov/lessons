struct node *Poisk_1 (k,Tree) 
int k;
struct node **Tree;
{
	if (*Tree==NULL) 
		return (NULL);
	else 
		if ((**Tree).Key==k)
			return (*Tree);
		else 
		{ 
			if (k<(**Tree).Key)
				return Poisk_1 (k,&((**Tree).Left));
			else 
				return Poisk_1 (k,&((**Tree).Right));
		} 
}


