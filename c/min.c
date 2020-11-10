
int main() {
	int arr [] = {10, 9, 2, 3, 5, 11, 9, 0};
	int i = 1;
	int min = arr[0];
	while(arr[i] != 0) {
		if (arr[i] < min)
			min = arr[i];
		i += 1;
	}
	return min;
}
