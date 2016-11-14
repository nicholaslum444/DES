; ModuleID = 'des-ob.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@initial_key_permutaion = global [56 x i32] [i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 60, i32 52, i32 44, i32 36, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 28, i32 20, i32 12, i32 4], align 16
@initial_message_permutation = global [64 x i32] [i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 60, i32 52, i32 44, i32 36, i32 28, i32 20, i32 12, i32 4, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 64, i32 56, i32 48, i32 40, i32 32, i32 24, i32 16, i32 8, i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7], align 16
@key_shift_sizes = global [17 x i32] [i32 -1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1], align 16
@sub_key_permutation = global [48 x i32] [i32 14, i32 17, i32 11, i32 24, i32 1, i32 5, i32 3, i32 28, i32 15, i32 6, i32 21, i32 10, i32 23, i32 19, i32 12, i32 4, i32 26, i32 8, i32 16, i32 7, i32 27, i32 20, i32 13, i32 2, i32 41, i32 52, i32 31, i32 37, i32 47, i32 55, i32 30, i32 40, i32 51, i32 45, i32 33, i32 48, i32 44, i32 49, i32 39, i32 56, i32 34, i32 53, i32 46, i32 42, i32 50, i32 36, i32 29, i32 32], align 16
@message_expansion = global [48 x i32] [i32 32, i32 1, i32 2, i32 3, i32 4, i32 5, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 28, i32 29, i32 30, i32 31, i32 32, i32 1], align 16
@S1 = global [64 x i32] [i32 14, i32 4, i32 13, i32 1, i32 2, i32 15, i32 11, i32 8, i32 3, i32 10, i32 6, i32 12, i32 5, i32 9, i32 0, i32 7, i32 0, i32 15, i32 7, i32 4, i32 14, i32 2, i32 13, i32 1, i32 10, i32 6, i32 12, i32 11, i32 9, i32 5, i32 3, i32 8, i32 4, i32 1, i32 14, i32 8, i32 13, i32 6, i32 2, i32 11, i32 15, i32 12, i32 9, i32 7, i32 3, i32 10, i32 5, i32 0, i32 15, i32 12, i32 8, i32 2, i32 4, i32 9, i32 1, i32 7, i32 5, i32 11, i32 3, i32 14, i32 10, i32 0, i32 6, i32 13], align 16
@S2 = global [64 x i32] [i32 15, i32 1, i32 8, i32 14, i32 6, i32 11, i32 3, i32 4, i32 9, i32 7, i32 2, i32 13, i32 12, i32 0, i32 5, i32 10, i32 3, i32 13, i32 4, i32 7, i32 15, i32 2, i32 8, i32 14, i32 12, i32 0, i32 1, i32 10, i32 6, i32 9, i32 11, i32 5, i32 0, i32 14, i32 7, i32 11, i32 10, i32 4, i32 13, i32 1, i32 5, i32 8, i32 12, i32 6, i32 9, i32 3, i32 2, i32 15, i32 13, i32 8, i32 10, i32 1, i32 3, i32 15, i32 4, i32 2, i32 11, i32 6, i32 7, i32 12, i32 0, i32 5, i32 14, i32 9], align 16
@S3 = global [64 x i32] [i32 10, i32 0, i32 9, i32 14, i32 6, i32 3, i32 15, i32 5, i32 1, i32 13, i32 12, i32 7, i32 11, i32 4, i32 2, i32 8, i32 13, i32 7, i32 0, i32 9, i32 3, i32 4, i32 6, i32 10, i32 2, i32 8, i32 5, i32 14, i32 12, i32 11, i32 15, i32 1, i32 13, i32 6, i32 4, i32 9, i32 8, i32 15, i32 3, i32 0, i32 11, i32 1, i32 2, i32 12, i32 5, i32 10, i32 14, i32 7, i32 1, i32 10, i32 13, i32 0, i32 6, i32 9, i32 8, i32 7, i32 4, i32 15, i32 14, i32 3, i32 11, i32 5, i32 2, i32 12], align 16
@S4 = global [64 x i32] [i32 7, i32 13, i32 14, i32 3, i32 0, i32 6, i32 9, i32 10, i32 1, i32 2, i32 8, i32 5, i32 11, i32 12, i32 4, i32 15, i32 13, i32 8, i32 11, i32 5, i32 6, i32 15, i32 0, i32 3, i32 4, i32 7, i32 2, i32 12, i32 1, i32 10, i32 14, i32 9, i32 10, i32 6, i32 9, i32 0, i32 12, i32 11, i32 7, i32 13, i32 15, i32 1, i32 3, i32 14, i32 5, i32 2, i32 8, i32 4, i32 3, i32 15, i32 0, i32 6, i32 10, i32 1, i32 13, i32 8, i32 9, i32 4, i32 5, i32 11, i32 12, i32 7, i32 2, i32 14], align 16
@S5 = global [64 x i32] [i32 2, i32 12, i32 4, i32 1, i32 7, i32 10, i32 11, i32 6, i32 8, i32 5, i32 3, i32 15, i32 13, i32 0, i32 14, i32 9, i32 14, i32 11, i32 2, i32 12, i32 4, i32 7, i32 13, i32 1, i32 5, i32 0, i32 15, i32 10, i32 3, i32 9, i32 8, i32 6, i32 4, i32 2, i32 1, i32 11, i32 10, i32 13, i32 7, i32 8, i32 15, i32 9, i32 12, i32 5, i32 6, i32 3, i32 0, i32 14, i32 11, i32 8, i32 12, i32 7, i32 1, i32 14, i32 2, i32 13, i32 6, i32 15, i32 0, i32 9, i32 10, i32 4, i32 5, i32 3], align 16
@S6 = global [64 x i32] [i32 12, i32 1, i32 10, i32 15, i32 9, i32 2, i32 6, i32 8, i32 0, i32 13, i32 3, i32 4, i32 14, i32 7, i32 5, i32 11, i32 10, i32 15, i32 4, i32 2, i32 7, i32 12, i32 9, i32 5, i32 6, i32 1, i32 13, i32 14, i32 0, i32 11, i32 3, i32 8, i32 9, i32 14, i32 15, i32 5, i32 2, i32 8, i32 12, i32 3, i32 7, i32 0, i32 4, i32 10, i32 1, i32 13, i32 11, i32 6, i32 4, i32 3, i32 2, i32 12, i32 9, i32 5, i32 15, i32 10, i32 11, i32 14, i32 1, i32 7, i32 6, i32 0, i32 8, i32 13], align 16
@S7 = global [64 x i32] [i32 4, i32 11, i32 2, i32 14, i32 15, i32 0, i32 8, i32 13, i32 3, i32 12, i32 9, i32 7, i32 5, i32 10, i32 6, i32 1, i32 13, i32 0, i32 11, i32 7, i32 4, i32 9, i32 1, i32 10, i32 14, i32 3, i32 5, i32 12, i32 2, i32 15, i32 8, i32 6, i32 1, i32 4, i32 11, i32 13, i32 12, i32 3, i32 7, i32 14, i32 10, i32 15, i32 6, i32 8, i32 0, i32 5, i32 9, i32 2, i32 6, i32 11, i32 13, i32 8, i32 1, i32 4, i32 10, i32 7, i32 9, i32 5, i32 0, i32 15, i32 14, i32 2, i32 3, i32 12], align 16
@S8 = global [64 x i32] [i32 13, i32 2, i32 8, i32 4, i32 6, i32 15, i32 11, i32 1, i32 10, i32 9, i32 3, i32 14, i32 5, i32 0, i32 12, i32 7, i32 1, i32 15, i32 13, i32 8, i32 10, i32 3, i32 7, i32 4, i32 12, i32 5, i32 6, i32 11, i32 0, i32 14, i32 9, i32 2, i32 7, i32 11, i32 4, i32 1, i32 9, i32 12, i32 14, i32 2, i32 0, i32 6, i32 10, i32 13, i32 15, i32 3, i32 5, i32 8, i32 2, i32 1, i32 14, i32 7, i32 4, i32 10, i32 8, i32 13, i32 15, i32 12, i32 9, i32 0, i32 3, i32 5, i32 6, i32 11], align 16
@right_sub_message_permutation = global [32 x i32] [i32 16, i32 7, i32 20, i32 21, i32 29, i32 12, i32 28, i32 17, i32 1, i32 15, i32 23, i32 26, i32 5, i32 18, i32 31, i32 10, i32 2, i32 8, i32 24, i32 14, i32 32, i32 27, i32 3, i32 9, i32 19, i32 13, i32 30, i32 6, i32 22, i32 11, i32 4, i32 25], align 16
@final_message_permutation = global [64 x i32] [i32 40, i32 8, i32 48, i32 16, i32 56, i32 24, i32 64, i32 32, i32 39, i32 7, i32 47, i32 15, i32 55, i32 23, i32 63, i32 31, i32 38, i32 6, i32 46, i32 14, i32 54, i32 22, i32 62, i32 30, i32 37, i32 5, i32 45, i32 13, i32 53, i32 21, i32 61, i32 29, i32 36, i32 4, i32 44, i32 12, i32 52, i32 20, i32 60, i32 28, i32 35, i32 3, i32 43, i32 11, i32 51, i32 19, i32 59, i32 27, i32 34, i32 2, i32 42, i32 10, i32 50, i32 18, i32 58, i32 26, i32 33, i32 1, i32 41, i32 9, i32 49, i32 17, i32 57, i32 25], align 16
@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"K: \0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"%02X : \00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"\0AC: \0A\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"\0AD: \0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print_char_as_binary(i8 signext %input) #0 {
  %1 = alloca i8, align 1
  %i = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  store i8 %input, i8* %1, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %34, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %41

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sub i32 0, %6
  %8 = xor i32 7, %7
  %9 = and i32 7, %7
  %10 = add i32 %9, %9
  %11 = add nsw i32 %8, %10
  %12 = sub nsw i32 7, %6
  %13 = shl i32 1, %11
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %shift_byte, align 1
  %15 = load i8* %shift_byte, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8* %1, align 1
  %18 = sext i8 %17 to i32
  %19 = xor i32 809305860, -1
  %20 = or i32 %16, 809305860
  %21 = or i32 %18, 809305860
  %22 = or i32 %16, %19
  %23 = or i32 %18, %19
  %24 = and i32 %20, %21
  %25 = and i32 %24, %22
  %26 = and i32 %25, %23
  %27 = and i32 %16, %18
  %28 = icmp ne i32 %26, 0
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %33

; <label>:31                                      ; preds = %5
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %33

; <label>:33                                      ; preds = %31, %29
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = xor i32 %35, 1
  %37 = and i32 %35, 1
  %38 = add i32 %37, %37
  %39 = add nsw i32 %36, %38
  %40 = add nsw i32 %35, 1
  store i32 %39, i32* %i, align 4
  br label %2

; <label>:41                                      ; preds = %2
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @generate_key(i8* %key) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %key, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 255
  %8 = trunc i32 %7 to i8
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8** %1, align 8
  %12 = getelementptr inbounds i8* %11, i64 %10
  store i8 %8, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %5
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @print_key_set(i64 %key_set.coerce0, i64 %key_set.coerce1) #0 {
  %key_set = alloca %struct.key_set, align 8
  %i = alloca i32, align 4
  %1 = bitcast %struct.key_set* %key_set to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  store i64 %key_set.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  store i64 %key_set.coerce1, i64* %3
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %22, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %10
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %19 = getelementptr inbounds [8 x i8]* %18, i32 0, i64 %17
  %20 = load i8* %19, align 1
  call void @print_char_as_binary(i8 signext %20)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %8
  %23 = load i32* %i, align 4
  %24 = xor i32 %23, 1
  %25 = and i32 %23, 1
  %26 = add i32 %25, %25
  %27 = add nsw i32 %24, %26
  %28 = add nsw i32 %23, 1
  store i32 %27, i32* %i, align 4
  br label %5

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %48, %29
  %32 = load i32* %i, align 4
  %33 = icmp slt i32 %32, 4
  br i1 %33, label %34, label %55

; <label>:34                                      ; preds = %31
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %38 = getelementptr inbounds [4 x i8]* %37, i32 0, i64 %36
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %40)
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %45 = getelementptr inbounds [4 x i8]* %44, i32 0, i64 %43
  %46 = load i8* %45, align 1
  call void @print_char_as_binary(i8 signext %46)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %34
  %49 = load i32* %i, align 4
  %50 = xor i32 %49, 1
  %51 = and i32 %49, 1
  %52 = add i32 %51, %51
  %53 = add nsw i32 %50, %52
  %54 = add nsw i32 %49, 1
  store i32 %53, i32* %i, align 4
  br label %31

; <label>:55                                      ; preds = %31
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %74, %55
  %58 = load i32* %i, align 4
  %59 = icmp slt i32 %58, 4
  br i1 %59, label %60, label %81

; <label>:60                                      ; preds = %57
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %64 = getelementptr inbounds [4 x i8]* %63, i32 0, i64 %62
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %66)
  %68 = load i32* %i, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %71 = getelementptr inbounds [4 x i8]* %70, i32 0, i64 %69
  %72 = load i8* %71, align 1
  call void @print_char_as_binary(i8 signext %72)
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %74

; <label>:74                                      ; preds = %60
  %75 = load i32* %i, align 4
  %76 = xor i32 %75, 1
  %77 = and i32 %75, 1
  %78 = add i32 %77, %77
  %79 = add nsw i32 %76, %78
  %80 = add nsw i32 %75, 1
  store i32 %79, i32* %i, align 4
  br label %57

; <label>:81                                      ; preds = %57
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @generate_sub_keys(i8* %main_key, %struct.key_set* %key_sets) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.key_set*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %first_shift_bits = alloca i8, align 1
  %second_shift_bits = alloca i8, align 1
  %third_shift_bits = alloca i8, align 1
  %fourth_shift_bits = alloca i8, align 1
  store i8* %main_key, i8** %1, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load %struct.key_set** %2, align 8
  %10 = getelementptr inbounds %struct.key_set* %9, i64 0
  %11 = getelementptr inbounds %struct.key_set* %10, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %8
  store i8 0, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:20                                      ; preds = %3
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %95, %20
  %22 = load i32* %i, align 4
  %23 = icmp slt i32 %22, 56
  br i1 %23, label %24, label %102

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [56 x i32]* @initial_key_permutaion, i32 0, i64 %26
  %28 = load i32* %27, align 4
  store i32 %28, i32* %shift_size, align 4
  %29 = load i32* %shift_size, align 4
  %30 = sub i32 0, 1
  %31 = xor i32 %29, %30
  %32 = and i32 %29, %30
  %33 = add i32 %32, %32
  %34 = add nsw i32 %31, %33
  %35 = sub nsw i32 %29, 1
  %36 = srem i32 %34, 8
  %37 = ashr i32 128, %36
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %shift_byte, align 1
  %39 = load i32* %shift_size, align 4
  %40 = sub i32 0, 1
  %41 = xor i32 %39, %40
  %42 = and i32 %39, %40
  %43 = add i32 %42, %42
  %44 = add nsw i32 %41, %43
  %45 = sub nsw i32 %39, 1
  %46 = sdiv i32 %44, 8
  %47 = sext i32 %46 to i64
  %48 = load i8** %1, align 8
  %49 = getelementptr inbounds i8* %48, i64 %47
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = load i8* %shift_byte, align 1
  %53 = zext i8 %52 to i32
  %54 = xor i32 -744877968, -1
  %55 = or i32 %53, -744877968
  %56 = or i32 %51, -744877968
  %57 = or i32 %53, %54
  %58 = or i32 %51, %54
  %59 = and i32 %55, %56
  %60 = and i32 %59, %57
  %61 = and i32 %60, %58
  %62 = and i32 %53, %51
  %63 = trunc i32 %61 to i8
  store i8 %63, i8* %shift_byte, align 1
  %64 = load i32* %shift_size, align 4
  %65 = sub i32 0, 1
  %66 = xor i32 %64, %65
  %67 = and i32 %64, %65
  %68 = add i32 %67, %67
  %69 = add nsw i32 %66, %68
  %70 = sub nsw i32 %64, 1
  %71 = srem i32 %69, 8
  %72 = load i8* %shift_byte, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, %71
  %75 = trunc i32 %74 to i8
  store i8 %75, i8* %shift_byte, align 1
  %76 = load i8* %shift_byte, align 1
  %77 = zext i8 %76 to i32
  %78 = load i32* %i, align 4
  %79 = srem i32 %78, 8
  %80 = ashr i32 %77, %79
  %81 = load i32* %i, align 4
  %82 = sdiv i32 %81, 8
  %83 = sext i32 %82 to i64
  %84 = load %struct.key_set** %2, align 8
  %85 = getelementptr inbounds %struct.key_set* %84, i64 0
  %86 = getelementptr inbounds %struct.key_set* %85, i32 0, i32 0
  %87 = getelementptr inbounds [8 x i8]* %86, i32 0, i64 %83
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = and i32 %89, %80
  %91 = xor i32 %89, %80
  %92 = or i32 %90, %91
  %93 = or i32 %89, %80
  %94 = trunc i32 %92 to i8
  store i8 %94, i8* %87, align 1
  br label %95

; <label>:95                                      ; preds = %24
  %96 = load i32* %i, align 4
  %97 = xor i32 %96, 1
  %98 = and i32 %96, 1
  %99 = add i32 %98, %98
  %100 = add nsw i32 %97, %99
  %101 = add nsw i32 %96, 1
  store i32 %100, i32* %i, align 4
  br label %21

; <label>:102                                     ; preds = %21
  store i32 0, i32* %i, align 4
  br label %103

; <label>:103                                     ; preds = %120, %102
  %104 = load i32* %i, align 4
  %105 = icmp slt i32 %104, 3
  br i1 %105, label %106, label %127

; <label>:106                                     ; preds = %103
  %107 = load i32* %i, align 4
  %108 = sext i32 %107 to i64
  %109 = load %struct.key_set** %2, align 8
  %110 = getelementptr inbounds %struct.key_set* %109, i64 0
  %111 = getelementptr inbounds %struct.key_set* %110, i32 0, i32 0
  %112 = getelementptr inbounds [8 x i8]* %111, i32 0, i64 %108
  %113 = load i8* %112, align 1
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load %struct.key_set** %2, align 8
  %117 = getelementptr inbounds %struct.key_set* %116, i64 0
  %118 = getelementptr inbounds %struct.key_set* %117, i32 0, i32 1
  %119 = getelementptr inbounds [4 x i8]* %118, i32 0, i64 %115
  store i8 %113, i8* %119, align 1
  br label %120

; <label>:120                                     ; preds = %106
  %121 = load i32* %i, align 4
  %122 = xor i32 %121, 1
  %123 = and i32 %121, 1
  %124 = add i32 %123, %123
  %125 = add nsw i32 %122, %124
  %126 = add nsw i32 %121, 1
  store i32 %125, i32* %i, align 4
  br label %103

; <label>:127                                     ; preds = %103
  %128 = load %struct.key_set** %2, align 8
  %129 = getelementptr inbounds %struct.key_set* %128, i64 0
  %130 = getelementptr inbounds %struct.key_set* %129, i32 0, i32 0
  %131 = getelementptr inbounds [8 x i8]* %130, i32 0, i64 3
  %132 = load i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = xor i32 1449492538, -1
  %135 = or i32 %133, 1449492538
  %136 = or i32 240, 1449492538
  %137 = or i32 %133, %134
  %138 = or i32 240, %134
  %139 = and i32 %135, %136
  %140 = and i32 %139, %137
  %141 = and i32 %140, %138
  %142 = and i32 %133, 240
  %143 = trunc i32 %141 to i8
  %144 = load %struct.key_set** %2, align 8
  %145 = getelementptr inbounds %struct.key_set* %144, i64 0
  %146 = getelementptr inbounds %struct.key_set* %145, i32 0, i32 1
  %147 = getelementptr inbounds [4 x i8]* %146, i32 0, i64 3
  store i8 %143, i8* %147, align 1
  store i32 0, i32* %i, align 4
  br label %148

; <label>:148                                     ; preds = %230, %127
  %149 = load i32* %i, align 4
  %150 = icmp slt i32 %149, 3
  br i1 %150, label %151, label %237

; <label>:151                                     ; preds = %148
  %152 = load i32* %i, align 4
  %153 = xor i32 %152, 3
  %154 = and i32 %152, 3
  %155 = add i32 %154, %154
  %156 = add nsw i32 %153, %155
  %157 = add nsw i32 %152, 3
  %158 = sext i32 %156 to i64
  %159 = load %struct.key_set** %2, align 8
  %160 = getelementptr inbounds %struct.key_set* %159, i64 0
  %161 = getelementptr inbounds %struct.key_set* %160, i32 0, i32 0
  %162 = getelementptr inbounds [8 x i8]* %161, i32 0, i64 %158
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = xor i32 96098043, -1
  %166 = or i32 %164, 96098043
  %167 = or i32 15, 96098043
  %168 = or i32 %164, %165
  %169 = or i32 15, %165
  %170 = and i32 %166, %167
  %171 = and i32 %170, %168
  %172 = and i32 %171, %169
  %173 = and i32 %164, 15
  %174 = shl i32 %172, 4
  %175 = trunc i32 %174 to i8
  %176 = load i32* %i, align 4
  %177 = sext i32 %176 to i64
  %178 = load %struct.key_set** %2, align 8
  %179 = getelementptr inbounds %struct.key_set* %178, i64 0
  %180 = getelementptr inbounds %struct.key_set* %179, i32 0, i32 2
  %181 = getelementptr inbounds [4 x i8]* %180, i32 0, i64 %177
  store i8 %175, i8* %181, align 1
  %182 = load i32* %i, align 4
  %183 = xor i32 %182, 4
  %184 = and i32 %182, 4
  %185 = add i32 %184, %184
  %186 = add nsw i32 %183, %185
  %187 = add nsw i32 %182, 4
  %188 = sext i32 %186 to i64
  %189 = load %struct.key_set** %2, align 8
  %190 = getelementptr inbounds %struct.key_set* %189, i64 0
  %191 = getelementptr inbounds %struct.key_set* %190, i32 0, i32 0
  %192 = getelementptr inbounds [8 x i8]* %191, i32 0, i64 %188
  %193 = load i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = xor i32 -26561230, -1
  %196 = or i32 %194, -26561230
  %197 = or i32 240, -26561230
  %198 = or i32 %194, %195
  %199 = or i32 240, %195
  %200 = and i32 %196, %197
  %201 = and i32 %200, %198
  %202 = and i32 %201, %199
  %203 = and i32 %194, 240
  %204 = ashr i32 %202, 4
  %205 = load i32* %i, align 4
  %206 = sext i32 %205 to i64
  %207 = load %struct.key_set** %2, align 8
  %208 = getelementptr inbounds %struct.key_set* %207, i64 0
  %209 = getelementptr inbounds %struct.key_set* %208, i32 0, i32 2
  %210 = getelementptr inbounds [4 x i8]* %209, i32 0, i64 %206
  %211 = load i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = xor i32 %212, -1
  %214 = xor i32 %204, -1
  %215 = xor i32 -1666328036, -1
  %216 = and i32 %213, -1666328036
  %217 = and i32 %212, %215
  %218 = and i32 %214, -1666328036
  %219 = and i32 %204, %215
  %220 = or i32 %216, %217
  %221 = or i32 %218, %219
  %222 = xor i32 %220, %221
  %223 = or i32 %213, %214
  %224 = xor i32 %223, -1
  %225 = or i32 -1666328036, %215
  %226 = and i32 %224, %225
  %227 = or i32 %222, %226
  %228 = or i32 %212, %204
  %229 = trunc i32 %227 to i8
  store i8 %229, i8* %210, align 1
  br label %230

; <label>:230                                     ; preds = %151
  %231 = load i32* %i, align 4
  %232 = xor i32 %231, 1
  %233 = and i32 %231, 1
  %234 = add i32 %233, %233
  %235 = add nsw i32 %232, %234
  %236 = add nsw i32 %231, 1
  store i32 %235, i32* %i, align 4
  br label %148

; <label>:237                                     ; preds = %148
  %238 = load %struct.key_set** %2, align 8
  %239 = getelementptr inbounds %struct.key_set* %238, i64 0
  %240 = getelementptr inbounds %struct.key_set* %239, i32 0, i32 0
  %241 = getelementptr inbounds [8 x i8]* %240, i32 0, i64 6
  %242 = load i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = xor i32 1996852671, -1
  %245 = or i32 %243, 1996852671
  %246 = or i32 15, 1996852671
  %247 = or i32 %243, %244
  %248 = or i32 15, %244
  %249 = and i32 %245, %246
  %250 = and i32 %249, %247
  %251 = and i32 %250, %248
  %252 = and i32 %243, 15
  %253 = shl i32 %251, 4
  %254 = trunc i32 %253 to i8
  %255 = load %struct.key_set** %2, align 8
  %256 = getelementptr inbounds %struct.key_set* %255, i64 0
  %257 = getelementptr inbounds %struct.key_set* %256, i32 0, i32 2
  %258 = getelementptr inbounds [4 x i8]* %257, i32 0, i64 3
  store i8 %254, i8* %258, align 1
  store i32 1, i32* %i, align 4
  br label %259

; <label>:259                                     ; preds = %978, %237
  %260 = load i32* %i, align 4
  %261 = icmp slt i32 %260, 17
  br i1 %261, label %262, label %985

; <label>:262                                     ; preds = %259
  store i32 0, i32* %j, align 4
  br label %263

; <label>:263                                     ; preds = %313, %262
  %264 = load i32* %j, align 4
  %265 = icmp slt i32 %264, 4
  br i1 %265, label %266, label %320

; <label>:266                                     ; preds = %263
  %267 = load i32* %j, align 4
  %268 = sext i32 %267 to i64
  %269 = load i32* %i, align 4
  %270 = sub i32 0, 1
  %271 = xor i32 %269, %270
  %272 = and i32 %269, %270
  %273 = add i32 %272, %272
  %274 = add nsw i32 %271, %273
  %275 = sub nsw i32 %269, 1
  %276 = sext i32 %274 to i64
  %277 = load %struct.key_set** %2, align 8
  %278 = getelementptr inbounds %struct.key_set* %277, i64 %276
  %279 = getelementptr inbounds %struct.key_set* %278, i32 0, i32 1
  %280 = getelementptr inbounds [4 x i8]* %279, i32 0, i64 %268
  %281 = load i8* %280, align 1
  %282 = load i32* %j, align 4
  %283 = sext i32 %282 to i64
  %284 = load i32* %i, align 4
  %285 = sext i32 %284 to i64
  %286 = load %struct.key_set** %2, align 8
  %287 = getelementptr inbounds %struct.key_set* %286, i64 %285
  %288 = getelementptr inbounds %struct.key_set* %287, i32 0, i32 1
  %289 = getelementptr inbounds [4 x i8]* %288, i32 0, i64 %283
  store i8 %281, i8* %289, align 1
  %290 = load i32* %j, align 4
  %291 = sext i32 %290 to i64
  %292 = load i32* %i, align 4
  %293 = sub i32 0, 1
  %294 = xor i32 %292, %293
  %295 = and i32 %292, %293
  %296 = add i32 %295, %295
  %297 = add nsw i32 %294, %296
  %298 = sub nsw i32 %292, 1
  %299 = sext i32 %297 to i64
  %300 = load %struct.key_set** %2, align 8
  %301 = getelementptr inbounds %struct.key_set* %300, i64 %299
  %302 = getelementptr inbounds %struct.key_set* %301, i32 0, i32 2
  %303 = getelementptr inbounds [4 x i8]* %302, i32 0, i64 %291
  %304 = load i8* %303, align 1
  %305 = load i32* %j, align 4
  %306 = sext i32 %305 to i64
  %307 = load i32* %i, align 4
  %308 = sext i32 %307 to i64
  %309 = load %struct.key_set** %2, align 8
  %310 = getelementptr inbounds %struct.key_set* %309, i64 %308
  %311 = getelementptr inbounds %struct.key_set* %310, i32 0, i32 2
  %312 = getelementptr inbounds [4 x i8]* %311, i32 0, i64 %306
  store i8 %304, i8* %312, align 1
  br label %313

; <label>:313                                     ; preds = %266
  %314 = load i32* %j, align 4
  %315 = xor i32 %314, 1
  %316 = and i32 %314, 1
  %317 = add i32 %316, %316
  %318 = add nsw i32 %315, %317
  %319 = add nsw i32 %314, 1
  store i32 %318, i32* %j, align 4
  br label %263

; <label>:320                                     ; preds = %263
  %321 = load i32* %i, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [17 x i32]* @key_shift_sizes, i32 0, i64 %322
  %324 = load i32* %323, align 4
  store i32 %324, i32* %shift_size, align 4
  %325 = load i32* %shift_size, align 4
  %326 = icmp eq i32 %325, 1
  br i1 %326, label %327, label %328

; <label>:327                                     ; preds = %320
  store i8 -128, i8* %shift_byte, align 1
  br label %329

; <label>:328                                     ; preds = %320
  store i8 -64, i8* %shift_byte, align 1
  br label %329

; <label>:329                                     ; preds = %328, %327
  %330 = load i8* %shift_byte, align 1
  %331 = zext i8 %330 to i32
  %332 = load i32* %i, align 4
  %333 = sext i32 %332 to i64
  %334 = load %struct.key_set** %2, align 8
  %335 = getelementptr inbounds %struct.key_set* %334, i64 %333
  %336 = getelementptr inbounds %struct.key_set* %335, i32 0, i32 1
  %337 = getelementptr inbounds [4 x i8]* %336, i32 0, i64 0
  %338 = load i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = xor i32 -132332507, -1
  %341 = or i32 %331, -132332507
  %342 = or i32 %339, -132332507
  %343 = or i32 %331, %340
  %344 = or i32 %339, %340
  %345 = and i32 %341, %342
  %346 = and i32 %345, %343
  %347 = and i32 %346, %344
  %348 = and i32 %331, %339
  %349 = trunc i32 %347 to i8
  store i8 %349, i8* %first_shift_bits, align 1
  %350 = load i8* %shift_byte, align 1
  %351 = zext i8 %350 to i32
  %352 = load i32* %i, align 4
  %353 = sext i32 %352 to i64
  %354 = load %struct.key_set** %2, align 8
  %355 = getelementptr inbounds %struct.key_set* %354, i64 %353
  %356 = getelementptr inbounds %struct.key_set* %355, i32 0, i32 1
  %357 = getelementptr inbounds [4 x i8]* %356, i32 0, i64 1
  %358 = load i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = xor i32 -588334621, -1
  %361 = or i32 %351, -588334621
  %362 = or i32 %359, -588334621
  %363 = or i32 %351, %360
  %364 = or i32 %359, %360
  %365 = and i32 %361, %362
  %366 = and i32 %365, %363
  %367 = and i32 %366, %364
  %368 = and i32 %351, %359
  %369 = trunc i32 %367 to i8
  store i8 %369, i8* %second_shift_bits, align 1
  %370 = load i8* %shift_byte, align 1
  %371 = zext i8 %370 to i32
  %372 = load i32* %i, align 4
  %373 = sext i32 %372 to i64
  %374 = load %struct.key_set** %2, align 8
  %375 = getelementptr inbounds %struct.key_set* %374, i64 %373
  %376 = getelementptr inbounds %struct.key_set* %375, i32 0, i32 1
  %377 = getelementptr inbounds [4 x i8]* %376, i32 0, i64 2
  %378 = load i8* %377, align 1
  %379 = zext i8 %378 to i32
  %380 = xor i32 -1116835442, -1
  %381 = or i32 %371, -1116835442
  %382 = or i32 %379, -1116835442
  %383 = or i32 %371, %380
  %384 = or i32 %379, %380
  %385 = and i32 %381, %382
  %386 = and i32 %385, %383
  %387 = and i32 %386, %384
  %388 = and i32 %371, %379
  %389 = trunc i32 %387 to i8
  store i8 %389, i8* %third_shift_bits, align 1
  %390 = load i8* %shift_byte, align 1
  %391 = zext i8 %390 to i32
  %392 = load i32* %i, align 4
  %393 = sext i32 %392 to i64
  %394 = load %struct.key_set** %2, align 8
  %395 = getelementptr inbounds %struct.key_set* %394, i64 %393
  %396 = getelementptr inbounds %struct.key_set* %395, i32 0, i32 1
  %397 = getelementptr inbounds [4 x i8]* %396, i32 0, i64 3
  %398 = load i8* %397, align 1
  %399 = zext i8 %398 to i32
  %400 = xor i32 1509595808, -1
  %401 = or i32 %391, 1509595808
  %402 = or i32 %399, 1509595808
  %403 = or i32 %391, %400
  %404 = or i32 %399, %400
  %405 = and i32 %401, %402
  %406 = and i32 %405, %403
  %407 = and i32 %406, %404
  %408 = and i32 %391, %399
  %409 = trunc i32 %407 to i8
  store i8 %409, i8* %fourth_shift_bits, align 1
  %410 = load i32* %shift_size, align 4
  %411 = load i32* %i, align 4
  %412 = sext i32 %411 to i64
  %413 = load %struct.key_set** %2, align 8
  %414 = getelementptr inbounds %struct.key_set* %413, i64 %412
  %415 = getelementptr inbounds %struct.key_set* %414, i32 0, i32 1
  %416 = getelementptr inbounds [4 x i8]* %415, i32 0, i64 0
  %417 = load i8* %416, align 1
  %418 = zext i8 %417 to i32
  %419 = shl i32 %418, %410
  %420 = trunc i32 %419 to i8
  store i8 %420, i8* %416, align 1
  %421 = load i8* %second_shift_bits, align 1
  %422 = zext i8 %421 to i32
  %423 = load i32* %shift_size, align 4
  %424 = sub i32 0, %423
  %425 = xor i32 8, %424
  %426 = and i32 8, %424
  %427 = add i32 %426, %426
  %428 = add nsw i32 %425, %427
  %429 = sub nsw i32 8, %423
  %430 = ashr i32 %422, %428
  %431 = load i32* %i, align 4
  %432 = sext i32 %431 to i64
  %433 = load %struct.key_set** %2, align 8
  %434 = getelementptr inbounds %struct.key_set* %433, i64 %432
  %435 = getelementptr inbounds %struct.key_set* %434, i32 0, i32 1
  %436 = getelementptr inbounds [4 x i8]* %435, i32 0, i64 0
  %437 = load i8* %436, align 1
  %438 = zext i8 %437 to i32
  %439 = xor i32 %438, -1
  %440 = xor i32 %430, -1
  %441 = xor i32 312750054, -1
  %442 = and i32 %439, 312750054
  %443 = and i32 %438, %441
  %444 = and i32 %440, 312750054
  %445 = and i32 %430, %441
  %446 = or i32 %442, %443
  %447 = or i32 %444, %445
  %448 = xor i32 %446, %447
  %449 = or i32 %439, %440
  %450 = xor i32 %449, -1
  %451 = or i32 312750054, %441
  %452 = and i32 %450, %451
  %453 = or i32 %448, %452
  %454 = or i32 %438, %430
  %455 = trunc i32 %453 to i8
  store i8 %455, i8* %436, align 1
  %456 = load i32* %shift_size, align 4
  %457 = load i32* %i, align 4
  %458 = sext i32 %457 to i64
  %459 = load %struct.key_set** %2, align 8
  %460 = getelementptr inbounds %struct.key_set* %459, i64 %458
  %461 = getelementptr inbounds %struct.key_set* %460, i32 0, i32 1
  %462 = getelementptr inbounds [4 x i8]* %461, i32 0, i64 1
  %463 = load i8* %462, align 1
  %464 = zext i8 %463 to i32
  %465 = shl i32 %464, %456
  %466 = trunc i32 %465 to i8
  store i8 %466, i8* %462, align 1
  %467 = load i8* %third_shift_bits, align 1
  %468 = zext i8 %467 to i32
  %469 = load i32* %shift_size, align 4
  %470 = sub i32 0, %469
  %471 = xor i32 8, %470
  %472 = and i32 8, %470
  %473 = add i32 %472, %472
  %474 = add nsw i32 %471, %473
  %475 = sub nsw i32 8, %469
  %476 = ashr i32 %468, %474
  %477 = load i32* %i, align 4
  %478 = sext i32 %477 to i64
  %479 = load %struct.key_set** %2, align 8
  %480 = getelementptr inbounds %struct.key_set* %479, i64 %478
  %481 = getelementptr inbounds %struct.key_set* %480, i32 0, i32 1
  %482 = getelementptr inbounds [4 x i8]* %481, i32 0, i64 1
  %483 = load i8* %482, align 1
  %484 = zext i8 %483 to i32
  %485 = and i32 %484, %476
  %486 = xor i32 %484, %476
  %487 = or i32 %485, %486
  %488 = or i32 %484, %476
  %489 = trunc i32 %487 to i8
  store i8 %489, i8* %482, align 1
  %490 = load i32* %shift_size, align 4
  %491 = load i32* %i, align 4
  %492 = sext i32 %491 to i64
  %493 = load %struct.key_set** %2, align 8
  %494 = getelementptr inbounds %struct.key_set* %493, i64 %492
  %495 = getelementptr inbounds %struct.key_set* %494, i32 0, i32 1
  %496 = getelementptr inbounds [4 x i8]* %495, i32 0, i64 2
  %497 = load i8* %496, align 1
  %498 = zext i8 %497 to i32
  %499 = shl i32 %498, %490
  %500 = trunc i32 %499 to i8
  store i8 %500, i8* %496, align 1
  %501 = load i8* %fourth_shift_bits, align 1
  %502 = zext i8 %501 to i32
  %503 = load i32* %shift_size, align 4
  %504 = sub i32 0, %503
  %505 = xor i32 8, %504
  %506 = and i32 8, %504
  %507 = add i32 %506, %506
  %508 = add nsw i32 %505, %507
  %509 = sub nsw i32 8, %503
  %510 = ashr i32 %502, %508
  %511 = load i32* %i, align 4
  %512 = sext i32 %511 to i64
  %513 = load %struct.key_set** %2, align 8
  %514 = getelementptr inbounds %struct.key_set* %513, i64 %512
  %515 = getelementptr inbounds %struct.key_set* %514, i32 0, i32 1
  %516 = getelementptr inbounds [4 x i8]* %515, i32 0, i64 2
  %517 = load i8* %516, align 1
  %518 = zext i8 %517 to i32
  %519 = and i32 %518, %510
  %520 = xor i32 %518, %510
  %521 = or i32 %519, %520
  %522 = or i32 %518, %510
  %523 = trunc i32 %521 to i8
  store i8 %523, i8* %516, align 1
  %524 = load i32* %shift_size, align 4
  %525 = load i32* %i, align 4
  %526 = sext i32 %525 to i64
  %527 = load %struct.key_set** %2, align 8
  %528 = getelementptr inbounds %struct.key_set* %527, i64 %526
  %529 = getelementptr inbounds %struct.key_set* %528, i32 0, i32 1
  %530 = getelementptr inbounds [4 x i8]* %529, i32 0, i64 3
  %531 = load i8* %530, align 1
  %532 = zext i8 %531 to i32
  %533 = shl i32 %532, %524
  %534 = trunc i32 %533 to i8
  store i8 %534, i8* %530, align 1
  %535 = load i8* %first_shift_bits, align 1
  %536 = zext i8 %535 to i32
  %537 = load i32* %shift_size, align 4
  %538 = sub i32 0, %537
  %539 = xor i32 4, %538
  %540 = and i32 4, %538
  %541 = add i32 %540, %540
  %542 = add nsw i32 %539, %541
  %543 = sub nsw i32 4, %537
  %544 = ashr i32 %536, %542
  %545 = load i32* %i, align 4
  %546 = sext i32 %545 to i64
  %547 = load %struct.key_set** %2, align 8
  %548 = getelementptr inbounds %struct.key_set* %547, i64 %546
  %549 = getelementptr inbounds %struct.key_set* %548, i32 0, i32 1
  %550 = getelementptr inbounds [4 x i8]* %549, i32 0, i64 3
  %551 = load i8* %550, align 1
  %552 = zext i8 %551 to i32
  %553 = xor i32 %552, -1
  %554 = xor i32 %544, -1
  %555 = xor i32 -1278488073, -1
  %556 = and i32 %553, -1278488073
  %557 = and i32 %552, %555
  %558 = and i32 %554, -1278488073
  %559 = and i32 %544, %555
  %560 = or i32 %556, %557
  %561 = or i32 %558, %559
  %562 = xor i32 %560, %561
  %563 = or i32 %553, %554
  %564 = xor i32 %563, -1
  %565 = or i32 -1278488073, %555
  %566 = and i32 %564, %565
  %567 = or i32 %562, %566
  %568 = or i32 %552, %544
  %569 = trunc i32 %567 to i8
  store i8 %569, i8* %550, align 1
  %570 = load i8* %shift_byte, align 1
  %571 = zext i8 %570 to i32
  %572 = load i32* %i, align 4
  %573 = sext i32 %572 to i64
  %574 = load %struct.key_set** %2, align 8
  %575 = getelementptr inbounds %struct.key_set* %574, i64 %573
  %576 = getelementptr inbounds %struct.key_set* %575, i32 0, i32 2
  %577 = getelementptr inbounds [4 x i8]* %576, i32 0, i64 0
  %578 = load i8* %577, align 1
  %579 = zext i8 %578 to i32
  %580 = xor i32 -1369699259, -1
  %581 = or i32 %571, -1369699259
  %582 = or i32 %579, -1369699259
  %583 = or i32 %571, %580
  %584 = or i32 %579, %580
  %585 = and i32 %581, %582
  %586 = and i32 %585, %583
  %587 = and i32 %586, %584
  %588 = and i32 %571, %579
  %589 = trunc i32 %587 to i8
  store i8 %589, i8* %first_shift_bits, align 1
  %590 = load i8* %shift_byte, align 1
  %591 = zext i8 %590 to i32
  %592 = load i32* %i, align 4
  %593 = sext i32 %592 to i64
  %594 = load %struct.key_set** %2, align 8
  %595 = getelementptr inbounds %struct.key_set* %594, i64 %593
  %596 = getelementptr inbounds %struct.key_set* %595, i32 0, i32 2
  %597 = getelementptr inbounds [4 x i8]* %596, i32 0, i64 1
  %598 = load i8* %597, align 1
  %599 = zext i8 %598 to i32
  %600 = xor i32 -109168321, -1
  %601 = or i32 %591, -109168321
  %602 = or i32 %599, -109168321
  %603 = or i32 %591, %600
  %604 = or i32 %599, %600
  %605 = and i32 %601, %602
  %606 = and i32 %605, %603
  %607 = and i32 %606, %604
  %608 = and i32 %591, %599
  %609 = trunc i32 %607 to i8
  store i8 %609, i8* %second_shift_bits, align 1
  %610 = load i8* %shift_byte, align 1
  %611 = zext i8 %610 to i32
  %612 = load i32* %i, align 4
  %613 = sext i32 %612 to i64
  %614 = load %struct.key_set** %2, align 8
  %615 = getelementptr inbounds %struct.key_set* %614, i64 %613
  %616 = getelementptr inbounds %struct.key_set* %615, i32 0, i32 2
  %617 = getelementptr inbounds [4 x i8]* %616, i32 0, i64 2
  %618 = load i8* %617, align 1
  %619 = zext i8 %618 to i32
  %620 = xor i32 -1334292879, -1
  %621 = or i32 %611, -1334292879
  %622 = or i32 %619, -1334292879
  %623 = or i32 %611, %620
  %624 = or i32 %619, %620
  %625 = and i32 %621, %622
  %626 = and i32 %625, %623
  %627 = and i32 %626, %624
  %628 = and i32 %611, %619
  %629 = trunc i32 %627 to i8
  store i8 %629, i8* %third_shift_bits, align 1
  %630 = load i8* %shift_byte, align 1
  %631 = zext i8 %630 to i32
  %632 = load i32* %i, align 4
  %633 = sext i32 %632 to i64
  %634 = load %struct.key_set** %2, align 8
  %635 = getelementptr inbounds %struct.key_set* %634, i64 %633
  %636 = getelementptr inbounds %struct.key_set* %635, i32 0, i32 2
  %637 = getelementptr inbounds [4 x i8]* %636, i32 0, i64 3
  %638 = load i8* %637, align 1
  %639 = zext i8 %638 to i32
  %640 = xor i32 -1295381544, -1
  %641 = or i32 %631, -1295381544
  %642 = or i32 %639, -1295381544
  %643 = or i32 %631, %640
  %644 = or i32 %639, %640
  %645 = and i32 %641, %642
  %646 = and i32 %645, %643
  %647 = and i32 %646, %644
  %648 = and i32 %631, %639
  %649 = trunc i32 %647 to i8
  store i8 %649, i8* %fourth_shift_bits, align 1
  %650 = load i32* %shift_size, align 4
  %651 = load i32* %i, align 4
  %652 = sext i32 %651 to i64
  %653 = load %struct.key_set** %2, align 8
  %654 = getelementptr inbounds %struct.key_set* %653, i64 %652
  %655 = getelementptr inbounds %struct.key_set* %654, i32 0, i32 2
  %656 = getelementptr inbounds [4 x i8]* %655, i32 0, i64 0
  %657 = load i8* %656, align 1
  %658 = zext i8 %657 to i32
  %659 = shl i32 %658, %650
  %660 = trunc i32 %659 to i8
  store i8 %660, i8* %656, align 1
  %661 = load i8* %second_shift_bits, align 1
  %662 = zext i8 %661 to i32
  %663 = load i32* %shift_size, align 4
  %664 = sub i32 0, %663
  %665 = xor i32 8, %664
  %666 = and i32 8, %664
  %667 = add i32 %666, %666
  %668 = add nsw i32 %665, %667
  %669 = sub nsw i32 8, %663
  %670 = ashr i32 %662, %668
  %671 = load i32* %i, align 4
  %672 = sext i32 %671 to i64
  %673 = load %struct.key_set** %2, align 8
  %674 = getelementptr inbounds %struct.key_set* %673, i64 %672
  %675 = getelementptr inbounds %struct.key_set* %674, i32 0, i32 2
  %676 = getelementptr inbounds [4 x i8]* %675, i32 0, i64 0
  %677 = load i8* %676, align 1
  %678 = zext i8 %677 to i32
  %679 = and i32 %678, %670
  %680 = xor i32 %678, %670
  %681 = or i32 %679, %680
  %682 = or i32 %678, %670
  %683 = trunc i32 %681 to i8
  store i8 %683, i8* %676, align 1
  %684 = load i32* %shift_size, align 4
  %685 = load i32* %i, align 4
  %686 = sext i32 %685 to i64
  %687 = load %struct.key_set** %2, align 8
  %688 = getelementptr inbounds %struct.key_set* %687, i64 %686
  %689 = getelementptr inbounds %struct.key_set* %688, i32 0, i32 2
  %690 = getelementptr inbounds [4 x i8]* %689, i32 0, i64 1
  %691 = load i8* %690, align 1
  %692 = zext i8 %691 to i32
  %693 = shl i32 %692, %684
  %694 = trunc i32 %693 to i8
  store i8 %694, i8* %690, align 1
  %695 = load i8* %third_shift_bits, align 1
  %696 = zext i8 %695 to i32
  %697 = load i32* %shift_size, align 4
  %698 = sub i32 0, %697
  %699 = xor i32 8, %698
  %700 = and i32 8, %698
  %701 = add i32 %700, %700
  %702 = add nsw i32 %699, %701
  %703 = sub nsw i32 8, %697
  %704 = ashr i32 %696, %702
  %705 = load i32* %i, align 4
  %706 = sext i32 %705 to i64
  %707 = load %struct.key_set** %2, align 8
  %708 = getelementptr inbounds %struct.key_set* %707, i64 %706
  %709 = getelementptr inbounds %struct.key_set* %708, i32 0, i32 2
  %710 = getelementptr inbounds [4 x i8]* %709, i32 0, i64 1
  %711 = load i8* %710, align 1
  %712 = zext i8 %711 to i32
  %713 = xor i32 %712, -1
  %714 = xor i32 %704, -1
  %715 = xor i32 792335733, -1
  %716 = and i32 %713, 792335733
  %717 = and i32 %712, %715
  %718 = and i32 %714, 792335733
  %719 = and i32 %704, %715
  %720 = or i32 %716, %717
  %721 = or i32 %718, %719
  %722 = xor i32 %720, %721
  %723 = or i32 %713, %714
  %724 = xor i32 %723, -1
  %725 = or i32 792335733, %715
  %726 = and i32 %724, %725
  %727 = or i32 %722, %726
  %728 = or i32 %712, %704
  %729 = trunc i32 %727 to i8
  store i8 %729, i8* %710, align 1
  %730 = load i32* %shift_size, align 4
  %731 = load i32* %i, align 4
  %732 = sext i32 %731 to i64
  %733 = load %struct.key_set** %2, align 8
  %734 = getelementptr inbounds %struct.key_set* %733, i64 %732
  %735 = getelementptr inbounds %struct.key_set* %734, i32 0, i32 2
  %736 = getelementptr inbounds [4 x i8]* %735, i32 0, i64 2
  %737 = load i8* %736, align 1
  %738 = zext i8 %737 to i32
  %739 = shl i32 %738, %730
  %740 = trunc i32 %739 to i8
  store i8 %740, i8* %736, align 1
  %741 = load i8* %fourth_shift_bits, align 1
  %742 = zext i8 %741 to i32
  %743 = load i32* %shift_size, align 4
  %744 = sub i32 0, %743
  %745 = xor i32 8, %744
  %746 = and i32 8, %744
  %747 = add i32 %746, %746
  %748 = add nsw i32 %745, %747
  %749 = sub nsw i32 8, %743
  %750 = ashr i32 %742, %748
  %751 = load i32* %i, align 4
  %752 = sext i32 %751 to i64
  %753 = load %struct.key_set** %2, align 8
  %754 = getelementptr inbounds %struct.key_set* %753, i64 %752
  %755 = getelementptr inbounds %struct.key_set* %754, i32 0, i32 2
  %756 = getelementptr inbounds [4 x i8]* %755, i32 0, i64 2
  %757 = load i8* %756, align 1
  %758 = zext i8 %757 to i32
  %759 = xor i32 %758, -1
  %760 = xor i32 %750, -1
  %761 = xor i32 -1835878411, -1
  %762 = and i32 %759, -1835878411
  %763 = and i32 %758, %761
  %764 = and i32 %760, -1835878411
  %765 = and i32 %750, %761
  %766 = or i32 %762, %763
  %767 = or i32 %764, %765
  %768 = xor i32 %766, %767
  %769 = or i32 %759, %760
  %770 = xor i32 %769, -1
  %771 = or i32 -1835878411, %761
  %772 = and i32 %770, %771
  %773 = or i32 %768, %772
  %774 = or i32 %758, %750
  %775 = trunc i32 %773 to i8
  store i8 %775, i8* %756, align 1
  %776 = load i32* %shift_size, align 4
  %777 = load i32* %i, align 4
  %778 = sext i32 %777 to i64
  %779 = load %struct.key_set** %2, align 8
  %780 = getelementptr inbounds %struct.key_set* %779, i64 %778
  %781 = getelementptr inbounds %struct.key_set* %780, i32 0, i32 2
  %782 = getelementptr inbounds [4 x i8]* %781, i32 0, i64 3
  %783 = load i8* %782, align 1
  %784 = zext i8 %783 to i32
  %785 = shl i32 %784, %776
  %786 = trunc i32 %785 to i8
  store i8 %786, i8* %782, align 1
  %787 = load i8* %first_shift_bits, align 1
  %788 = zext i8 %787 to i32
  %789 = load i32* %shift_size, align 4
  %790 = sub i32 0, %789
  %791 = xor i32 4, %790
  %792 = and i32 4, %790
  %793 = add i32 %792, %792
  %794 = add nsw i32 %791, %793
  %795 = sub nsw i32 4, %789
  %796 = ashr i32 %788, %794
  %797 = load i32* %i, align 4
  %798 = sext i32 %797 to i64
  %799 = load %struct.key_set** %2, align 8
  %800 = getelementptr inbounds %struct.key_set* %799, i64 %798
  %801 = getelementptr inbounds %struct.key_set* %800, i32 0, i32 2
  %802 = getelementptr inbounds [4 x i8]* %801, i32 0, i64 3
  %803 = load i8* %802, align 1
  %804 = zext i8 %803 to i32
  %805 = xor i32 %804, -1
  %806 = xor i32 %796, -1
  %807 = xor i32 -45087645, -1
  %808 = and i32 %805, -45087645
  %809 = and i32 %804, %807
  %810 = and i32 %806, -45087645
  %811 = and i32 %796, %807
  %812 = or i32 %808, %809
  %813 = or i32 %810, %811
  %814 = xor i32 %812, %813
  %815 = or i32 %805, %806
  %816 = xor i32 %815, -1
  %817 = or i32 -45087645, %807
  %818 = and i32 %816, %817
  %819 = or i32 %814, %818
  %820 = or i32 %804, %796
  %821 = trunc i32 %819 to i8
  store i8 %821, i8* %802, align 1
  store i32 0, i32* %j, align 4
  br label %822

; <label>:822                                     ; preds = %970, %329
  %823 = load i32* %j, align 4
  %824 = icmp slt i32 %823, 48
  br i1 %824, label %825, label %977

; <label>:825                                     ; preds = %822
  %826 = load i32* %j, align 4
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds [48 x i32]* @sub_key_permutation, i32 0, i64 %827
  %829 = load i32* %828, align 4
  store i32 %829, i32* %shift_size, align 4
  %830 = load i32* %shift_size, align 4
  %831 = icmp sle i32 %830, 28
  br i1 %831, label %832, label %884

; <label>:832                                     ; preds = %825
  %833 = load i32* %shift_size, align 4
  %834 = sub i32 0, 1
  %835 = xor i32 %833, %834
  %836 = and i32 %833, %834
  %837 = add i32 %836, %836
  %838 = add nsw i32 %835, %837
  %839 = sub nsw i32 %833, 1
  %840 = srem i32 %838, 8
  %841 = ashr i32 128, %840
  %842 = trunc i32 %841 to i8
  store i8 %842, i8* %shift_byte, align 1
  %843 = load i32* %shift_size, align 4
  %844 = sub i32 0, 1
  %845 = xor i32 %843, %844
  %846 = and i32 %843, %844
  %847 = add i32 %846, %846
  %848 = add nsw i32 %845, %847
  %849 = sub nsw i32 %843, 1
  %850 = sdiv i32 %848, 8
  %851 = sext i32 %850 to i64
  %852 = load i32* %i, align 4
  %853 = sext i32 %852 to i64
  %854 = load %struct.key_set** %2, align 8
  %855 = getelementptr inbounds %struct.key_set* %854, i64 %853
  %856 = getelementptr inbounds %struct.key_set* %855, i32 0, i32 1
  %857 = getelementptr inbounds [4 x i8]* %856, i32 0, i64 %851
  %858 = load i8* %857, align 1
  %859 = zext i8 %858 to i32
  %860 = load i8* %shift_byte, align 1
  %861 = zext i8 %860 to i32
  %862 = xor i32 1535689177, -1
  %863 = or i32 %861, 1535689177
  %864 = or i32 %859, 1535689177
  %865 = or i32 %861, %862
  %866 = or i32 %859, %862
  %867 = and i32 %863, %864
  %868 = and i32 %867, %865
  %869 = and i32 %868, %866
  %870 = and i32 %861, %859
  %871 = trunc i32 %869 to i8
  store i8 %871, i8* %shift_byte, align 1
  %872 = load i32* %shift_size, align 4
  %873 = sub i32 0, 1
  %874 = xor i32 %872, %873
  %875 = and i32 %872, %873
  %876 = add i32 %875, %875
  %877 = add nsw i32 %874, %876
  %878 = sub nsw i32 %872, 1
  %879 = srem i32 %877, 8
  %880 = load i8* %shift_byte, align 1
  %881 = zext i8 %880 to i32
  %882 = shl i32 %881, %879
  %883 = trunc i32 %882 to i8
  store i8 %883, i8* %shift_byte, align 1
  br label %936

; <label>:884                                     ; preds = %825
  %885 = load i32* %shift_size, align 4
  %886 = sub i32 0, 29
  %887 = xor i32 %885, %886
  %888 = and i32 %885, %886
  %889 = add i32 %888, %888
  %890 = add nsw i32 %887, %889
  %891 = sub nsw i32 %885, 29
  %892 = srem i32 %890, 8
  %893 = ashr i32 128, %892
  %894 = trunc i32 %893 to i8
  store i8 %894, i8* %shift_byte, align 1
  %895 = load i32* %shift_size, align 4
  %896 = sub i32 0, 29
  %897 = xor i32 %895, %896
  %898 = and i32 %895, %896
  %899 = add i32 %898, %898
  %900 = add nsw i32 %897, %899
  %901 = sub nsw i32 %895, 29
  %902 = sdiv i32 %900, 8
  %903 = sext i32 %902 to i64
  %904 = load i32* %i, align 4
  %905 = sext i32 %904 to i64
  %906 = load %struct.key_set** %2, align 8
  %907 = getelementptr inbounds %struct.key_set* %906, i64 %905
  %908 = getelementptr inbounds %struct.key_set* %907, i32 0, i32 2
  %909 = getelementptr inbounds [4 x i8]* %908, i32 0, i64 %903
  %910 = load i8* %909, align 1
  %911 = zext i8 %910 to i32
  %912 = load i8* %shift_byte, align 1
  %913 = zext i8 %912 to i32
  %914 = xor i32 964683694, -1
  %915 = or i32 %913, 964683694
  %916 = or i32 %911, 964683694
  %917 = or i32 %913, %914
  %918 = or i32 %911, %914
  %919 = and i32 %915, %916
  %920 = and i32 %919, %917
  %921 = and i32 %920, %918
  %922 = and i32 %913, %911
  %923 = trunc i32 %921 to i8
  store i8 %923, i8* %shift_byte, align 1
  %924 = load i32* %shift_size, align 4
  %925 = sub i32 0, 29
  %926 = xor i32 %924, %925
  %927 = and i32 %924, %925
  %928 = add i32 %927, %927
  %929 = add nsw i32 %926, %928
  %930 = sub nsw i32 %924, 29
  %931 = srem i32 %929, 8
  %932 = load i8* %shift_byte, align 1
  %933 = zext i8 %932 to i32
  %934 = shl i32 %933, %931
  %935 = trunc i32 %934 to i8
  store i8 %935, i8* %shift_byte, align 1
  br label %936

; <label>:936                                     ; preds = %884, %832
  %937 = load i8* %shift_byte, align 1
  %938 = zext i8 %937 to i32
  %939 = load i32* %j, align 4
  %940 = srem i32 %939, 8
  %941 = ashr i32 %938, %940
  %942 = load i32* %j, align 4
  %943 = sdiv i32 %942, 8
  %944 = sext i32 %943 to i64
  %945 = load i32* %i, align 4
  %946 = sext i32 %945 to i64
  %947 = load %struct.key_set** %2, align 8
  %948 = getelementptr inbounds %struct.key_set* %947, i64 %946
  %949 = getelementptr inbounds %struct.key_set* %948, i32 0, i32 0
  %950 = getelementptr inbounds [8 x i8]* %949, i32 0, i64 %944
  %951 = load i8* %950, align 1
  %952 = zext i8 %951 to i32
  %953 = xor i32 %952, -1
  %954 = xor i32 %941, -1
  %955 = xor i32 -332609113, -1
  %956 = and i32 %953, -332609113
  %957 = and i32 %952, %955
  %958 = and i32 %954, -332609113
  %959 = and i32 %941, %955
  %960 = or i32 %956, %957
  %961 = or i32 %958, %959
  %962 = xor i32 %960, %961
  %963 = or i32 %953, %954
  %964 = xor i32 %963, -1
  %965 = or i32 -332609113, %955
  %966 = and i32 %964, %965
  %967 = or i32 %962, %966
  %968 = or i32 %952, %941
  %969 = trunc i32 %967 to i8
  store i8 %969, i8* %950, align 1
  br label %970

; <label>:970                                     ; preds = %936
  %971 = load i32* %j, align 4
  %972 = xor i32 %971, 1
  %973 = and i32 %971, 1
  %974 = add i32 %973, %973
  %975 = add nsw i32 %972, %974
  %976 = add nsw i32 %971, 1
  store i32 %975, i32* %j, align 4
  br label %822

; <label>:977                                     ; preds = %822
  br label %978

; <label>:978                                     ; preds = %977
  %979 = load i32* %i, align 4
  %980 = xor i32 %979, 1
  %981 = and i32 %979, 1
  %982 = add i32 %981, %981
  %983 = add nsw i32 %980, %982
  %984 = add nsw i32 %979, 1
  store i32 %983, i32* %i, align 4
  br label %259

; <label>:985                                     ; preds = %259
  ret void
}

; Function Attrs: nounwind uwtable
define void @process_message(i8* %message_piece, i8* %processed_piece, %struct.key_set* %key_sets, i32 %mode) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct.key_set*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %initial_permutation = alloca [8 x i8], align 1
  %l = alloca [4 x i8], align 1
  %r = alloca [4 x i8], align 1
  %ln = alloca [4 x i8], align 1
  %rn = alloca [4 x i8], align 1
  %er = alloca [6 x i8], align 1
  %ser = alloca [4 x i8], align 1
  %key_index = alloca i32, align 4
  %row = alloca i8, align 1
  %column = alloca i8, align 1
  %pre_end_permutation = alloca [8 x i8], align 1
  store i8* %message_piece, i8** %1, align 8
  store i8* %processed_piece, i8** %2, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %3, align 8
  store i32 %mode, i32* %4, align 4
  %5 = bitcast [8 x i8]* %initial_permutation to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 8, i32 1, i1 false)
  %6 = load i8** %2, align 8
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %78, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %85

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x i32]* @initial_message_permutation, i32 0, i64 %12
  %14 = load i32* %13, align 4
  store i32 %14, i32* %shift_size, align 4
  %15 = load i32* %shift_size, align 4
  %16 = sub i32 0, 1
  %17 = xor i32 %15, %16
  %18 = and i32 %15, %16
  %19 = add i32 %18, %18
  %20 = add nsw i32 %17, %19
  %21 = sub nsw i32 %15, 1
  %22 = srem i32 %20, 8
  %23 = ashr i32 128, %22
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %shift_byte, align 1
  %25 = load i32* %shift_size, align 4
  %26 = sub i32 0, 1
  %27 = xor i32 %25, %26
  %28 = and i32 %25, %26
  %29 = add i32 %28, %28
  %30 = add nsw i32 %27, %29
  %31 = sub nsw i32 %25, 1
  %32 = sdiv i32 %30, 8
  %33 = sext i32 %32 to i64
  %34 = load i8** %1, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8* %shift_byte, align 1
  %39 = zext i8 %38 to i32
  %40 = xor i32 -1820430766, -1
  %41 = or i32 %39, -1820430766
  %42 = or i32 %37, -1820430766
  %43 = or i32 %39, %40
  %44 = or i32 %37, %40
  %45 = and i32 %41, %42
  %46 = and i32 %45, %43
  %47 = and i32 %46, %44
  %48 = and i32 %39, %37
  %49 = trunc i32 %47 to i8
  store i8 %49, i8* %shift_byte, align 1
  %50 = load i32* %shift_size, align 4
  %51 = sub i32 0, 1
  %52 = xor i32 %50, %51
  %53 = and i32 %50, %51
  %54 = add i32 %53, %53
  %55 = add nsw i32 %52, %54
  %56 = sub nsw i32 %50, 1
  %57 = srem i32 %55, 8
  %58 = load i8* %shift_byte, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, %57
  %61 = trunc i32 %60 to i8
  store i8 %61, i8* %shift_byte, align 1
  %62 = load i8* %shift_byte, align 1
  %63 = zext i8 %62 to i32
  %64 = load i32* %i, align 4
  %65 = srem i32 %64, 8
  %66 = ashr i32 %63, %65
  %67 = load i32* %i, align 4
  %68 = sdiv i32 %67, 8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = and i32 %72, %66
  %74 = xor i32 %72, %66
  %75 = or i32 %73, %74
  %76 = or i32 %72, %66
  %77 = trunc i32 %75 to i8
  store i8 %77, i8* %70, align 1
  br label %78

; <label>:78                                      ; preds = %10
  %79 = load i32* %i, align 4
  %80 = xor i32 %79, 1
  %81 = and i32 %79, 1
  %82 = add i32 %81, %81
  %83 = add nsw i32 %80, %82
  %84 = add nsw i32 %79, 1
  store i32 %83, i32* %i, align 4
  br label %7

; <label>:85                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %86

; <label>:86                                      ; preds = %109, %85
  %87 = load i32* %i, align 4
  %88 = icmp slt i32 %87, 4
  br i1 %88, label %89, label %116

; <label>:89                                      ; preds = %86
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %91
  %93 = load i8* %92, align 1
  %94 = load i32* %i, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %95
  store i8 %93, i8* %96, align 1
  %97 = load i32* %i, align 4
  %98 = xor i32 %97, 4
  %99 = and i32 %97, 4
  %100 = add i32 %99, %99
  %101 = add nsw i32 %98, %100
  %102 = add nsw i32 %97, 4
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %103
  %105 = load i8* %104, align 1
  %106 = load i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %107
  store i8 %105, i8* %108, align 1
  br label %109

; <label>:109                                     ; preds = %89
  %110 = load i32* %i, align 4
  %111 = xor i32 %110, 1
  %112 = and i32 %110, 1
  %113 = add i32 %112, %112
  %114 = add nsw i32 %111, %113
  %115 = add nsw i32 %110, 1
  store i32 %114, i32* %i, align 4
  br label %86

; <label>:116                                     ; preds = %86
  store i32 1, i32* %k, align 4
  br label %117

; <label>:117                                     ; preds = %1382, %116
  %118 = load i32* %k, align 4
  %119 = icmp sle i32 %118, 16
  br i1 %119, label %120, label %1389

; <label>:120                                     ; preds = %117
  %121 = bitcast [4 x i8]* %ln to i8*
  %122 = bitcast [4 x i8]* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %121, i8* %122, i64 4, i32 1, i1 false)
  %123 = bitcast [6 x i8]* %er to i8*
  call void @llvm.memset.p0i8.i64(i8* %123, i8 0, i64 6, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %124

; <label>:124                                     ; preds = %194, %120
  %125 = load i32* %i, align 4
  %126 = icmp slt i32 %125, 48
  br i1 %126, label %127, label %201

; <label>:127                                     ; preds = %124
  %128 = load i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [48 x i32]* @message_expansion, i32 0, i64 %129
  %131 = load i32* %130, align 4
  store i32 %131, i32* %shift_size, align 4
  %132 = load i32* %shift_size, align 4
  %133 = sub i32 0, 1
  %134 = xor i32 %132, %133
  %135 = and i32 %132, %133
  %136 = add i32 %135, %135
  %137 = add nsw i32 %134, %136
  %138 = sub nsw i32 %132, 1
  %139 = srem i32 %137, 8
  %140 = ashr i32 128, %139
  %141 = trunc i32 %140 to i8
  store i8 %141, i8* %shift_byte, align 1
  %142 = load i32* %shift_size, align 4
  %143 = sub i32 0, 1
  %144 = xor i32 %142, %143
  %145 = and i32 %142, %143
  %146 = add i32 %145, %145
  %147 = add nsw i32 %144, %146
  %148 = sub nsw i32 %142, 1
  %149 = sdiv i32 %147, 8
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = load i8* %shift_byte, align 1
  %155 = zext i8 %154 to i32
  %156 = xor i32 1628122821, -1
  %157 = or i32 %155, 1628122821
  %158 = or i32 %153, 1628122821
  %159 = or i32 %155, %156
  %160 = or i32 %153, %156
  %161 = and i32 %157, %158
  %162 = and i32 %161, %159
  %163 = and i32 %162, %160
  %164 = and i32 %155, %153
  %165 = trunc i32 %163 to i8
  store i8 %165, i8* %shift_byte, align 1
  %166 = load i32* %shift_size, align 4
  %167 = sub i32 0, 1
  %168 = xor i32 %166, %167
  %169 = and i32 %166, %167
  %170 = add i32 %169, %169
  %171 = add nsw i32 %168, %170
  %172 = sub nsw i32 %166, 1
  %173 = srem i32 %171, 8
  %174 = load i8* %shift_byte, align 1
  %175 = zext i8 %174 to i32
  %176 = shl i32 %175, %173
  %177 = trunc i32 %176 to i8
  store i8 %177, i8* %shift_byte, align 1
  %178 = load i8* %shift_byte, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32* %i, align 4
  %181 = srem i32 %180, 8
  %182 = ashr i32 %179, %181
  %183 = load i32* %i, align 4
  %184 = sdiv i32 %183, 8
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %185
  %187 = load i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = and i32 %188, %182
  %190 = xor i32 %188, %182
  %191 = or i32 %189, %190
  %192 = or i32 %188, %182
  %193 = trunc i32 %191 to i8
  store i8 %193, i8* %186, align 1
  br label %194

; <label>:194                                     ; preds = %127
  %195 = load i32* %i, align 4
  %196 = xor i32 %195, 1
  %197 = and i32 %195, 1
  %198 = add i32 %197, %197
  %199 = add nsw i32 %196, %198
  %200 = add nsw i32 %195, 1
  store i32 %199, i32* %i, align 4
  br label %124

; <label>:201                                     ; preds = %124
  %202 = load i32* %4, align 4
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %212

; <label>:204                                     ; preds = %201
  %205 = load i32* %k, align 4
  %206 = sub i32 0, %205
  %207 = xor i32 17, %206
  %208 = and i32 17, %206
  %209 = add i32 %208, %208
  %210 = add nsw i32 %207, %209
  %211 = sub nsw i32 17, %205
  store i32 %210, i32* %key_index, align 4
  br label %214

; <label>:212                                     ; preds = %201
  %213 = load i32* %k, align 4
  store i32 %213, i32* %key_index, align 4
  br label %214

; <label>:214                                     ; preds = %212, %204
  store i32 0, i32* %i, align 4
  br label %215

; <label>:215                                     ; preds = %240, %214
  %216 = load i32* %i, align 4
  %217 = icmp slt i32 %216, 6
  br i1 %217, label %218, label %247

; <label>:218                                     ; preds = %215
  %219 = load i32* %i, align 4
  %220 = sext i32 %219 to i64
  %221 = load i32* %key_index, align 4
  %222 = sext i32 %221 to i64
  %223 = load %struct.key_set** %3, align 8
  %224 = getelementptr inbounds %struct.key_set* %223, i64 %222
  %225 = getelementptr inbounds %struct.key_set* %224, i32 0, i32 0
  %226 = getelementptr inbounds [8 x i8]* %225, i32 0, i64 %220
  %227 = load i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = load i32* %i, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %230
  %232 = load i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = and i32 %233, %228
  %235 = add i32 %234, %234
  %236 = add i32 %233, %228
  %237 = sub i32 %236, %235
  %238 = xor i32 %233, %228
  %239 = trunc i32 %237 to i8
  store i8 %239, i8* %231, align 1
  br label %240

; <label>:240                                     ; preds = %218
  %241 = load i32* %i, align 4
  %242 = xor i32 %241, 1
  %243 = and i32 %241, 1
  %244 = add i32 %243, %243
  %245 = add nsw i32 %242, %244
  %246 = add nsw i32 %241, 1
  store i32 %245, i32* %i, align 4
  br label %215

; <label>:247                                     ; preds = %215
  store i32 0, i32* %i, align 4
  br label %248

; <label>:248                                     ; preds = %255, %247
  %249 = load i32* %i, align 4
  %250 = icmp slt i32 %249, 4
  br i1 %250, label %251, label %262

; <label>:251                                     ; preds = %248
  %252 = load i32* %i, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %253
  store i8 0, i8* %254, align 1
  br label %255

; <label>:255                                     ; preds = %251
  %256 = load i32* %i, align 4
  %257 = xor i32 %256, 1
  %258 = and i32 %256, 1
  %259 = add i32 %258, %258
  %260 = add nsw i32 %257, %259
  %261 = add nsw i32 %256, 1
  store i32 %260, i32* %i, align 4
  br label %248

; <label>:262                                     ; preds = %248
  store i8 0, i8* %row, align 1
  %263 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %264 = load i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = xor i32 -236583070, -1
  %267 = or i32 %265, -236583070
  %268 = or i32 128, -236583070
  %269 = or i32 %265, %266
  %270 = or i32 128, %266
  %271 = and i32 %267, %268
  %272 = and i32 %271, %269
  %273 = and i32 %272, %270
  %274 = and i32 %265, 128
  %275 = ashr i32 %273, 6
  %276 = load i8* %row, align 1
  %277 = zext i8 %276 to i32
  %278 = xor i32 %277, -1
  %279 = xor i32 %275, -1
  %280 = xor i32 475279581, -1
  %281 = and i32 %278, 475279581
  %282 = and i32 %277, %280
  %283 = and i32 %279, 475279581
  %284 = and i32 %275, %280
  %285 = or i32 %281, %282
  %286 = or i32 %283, %284
  %287 = xor i32 %285, %286
  %288 = or i32 %278, %279
  %289 = xor i32 %288, -1
  %290 = or i32 475279581, %280
  %291 = and i32 %289, %290
  %292 = or i32 %287, %291
  %293 = or i32 %277, %275
  %294 = trunc i32 %292 to i8
  store i8 %294, i8* %row, align 1
  %295 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %296 = load i8* %295, align 1
  %297 = zext i8 %296 to i32
  %298 = xor i32 -388292740, -1
  %299 = or i32 %297, -388292740
  %300 = or i32 4, -388292740
  %301 = or i32 %297, %298
  %302 = or i32 4, %298
  %303 = and i32 %299, %300
  %304 = and i32 %303, %301
  %305 = and i32 %304, %302
  %306 = and i32 %297, 4
  %307 = ashr i32 %305, 2
  %308 = load i8* %row, align 1
  %309 = zext i8 %308 to i32
  %310 = and i32 %309, %307
  %311 = xor i32 %309, %307
  %312 = or i32 %310, %311
  %313 = or i32 %309, %307
  %314 = trunc i32 %312 to i8
  store i8 %314, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %315 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = xor i32 423456735, -1
  %319 = or i32 %317, 423456735
  %320 = or i32 120, 423456735
  %321 = or i32 %317, %318
  %322 = or i32 120, %318
  %323 = and i32 %319, %320
  %324 = and i32 %323, %321
  %325 = and i32 %324, %322
  %326 = and i32 %317, 120
  %327 = ashr i32 %325, 3
  %328 = load i8* %column, align 1
  %329 = zext i8 %328 to i32
  %330 = xor i32 %329, -1
  %331 = xor i32 %327, -1
  %332 = xor i32 873633786, -1
  %333 = and i32 %330, 873633786
  %334 = and i32 %329, %332
  %335 = and i32 %331, 873633786
  %336 = and i32 %327, %332
  %337 = or i32 %333, %334
  %338 = or i32 %335, %336
  %339 = xor i32 %337, %338
  %340 = or i32 %330, %331
  %341 = xor i32 %340, -1
  %342 = or i32 873633786, %332
  %343 = and i32 %341, %342
  %344 = or i32 %339, %343
  %345 = or i32 %329, %327
  %346 = trunc i32 %344 to i8
  store i8 %346, i8* %column, align 1
  %347 = load i8* %row, align 1
  %348 = zext i8 %347 to i32
  %349 = mul nsw i32 %348, 16
  %350 = load i8* %column, align 1
  %351 = zext i8 %350 to i32
  %352 = xor i32 %349, %351
  %353 = and i32 %349, %351
  %354 = add i32 %353, %353
  %355 = add nsw i32 %352, %354
  %356 = add nsw i32 %349, %351
  %357 = sext i32 %355 to i64
  %358 = getelementptr inbounds [64 x i32]* @S1, i32 0, i64 %357
  %359 = load i32* %358, align 4
  %360 = trunc i32 %359 to i8
  %361 = zext i8 %360 to i32
  %362 = shl i32 %361, 4
  %363 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %364 = load i8* %363, align 1
  %365 = zext i8 %364 to i32
  %366 = and i32 %365, %362
  %367 = xor i32 %365, %362
  %368 = or i32 %366, %367
  %369 = or i32 %365, %362
  %370 = trunc i32 %368 to i8
  store i8 %370, i8* %363, align 1
  store i8 0, i8* %row, align 1
  %371 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %372 = load i8* %371, align 1
  %373 = zext i8 %372 to i32
  %374 = xor i32 -1661006047, -1
  %375 = or i32 %373, -1661006047
  %376 = or i32 2, -1661006047
  %377 = or i32 %373, %374
  %378 = or i32 2, %374
  %379 = and i32 %375, %376
  %380 = and i32 %379, %377
  %381 = and i32 %380, %378
  %382 = and i32 %373, 2
  %383 = load i8* %row, align 1
  %384 = zext i8 %383 to i32
  %385 = xor i32 %384, -1
  %386 = xor i32 %381, -1
  %387 = xor i32 428026645, -1
  %388 = and i32 %385, 428026645
  %389 = and i32 %384, %387
  %390 = and i32 %386, 428026645
  %391 = and i32 %381, %387
  %392 = or i32 %388, %389
  %393 = or i32 %390, %391
  %394 = xor i32 %392, %393
  %395 = or i32 %385, %386
  %396 = xor i32 %395, -1
  %397 = or i32 428026645, %387
  %398 = and i32 %396, %397
  %399 = or i32 %394, %398
  %400 = or i32 %384, %381
  %401 = trunc i32 %399 to i8
  store i8 %401, i8* %row, align 1
  %402 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %403 = load i8* %402, align 1
  %404 = zext i8 %403 to i32
  %405 = xor i32 631571593, -1
  %406 = or i32 %404, 631571593
  %407 = or i32 16, 631571593
  %408 = or i32 %404, %405
  %409 = or i32 16, %405
  %410 = and i32 %406, %407
  %411 = and i32 %410, %408
  %412 = and i32 %411, %409
  %413 = and i32 %404, 16
  %414 = ashr i32 %412, 4
  %415 = load i8* %row, align 1
  %416 = zext i8 %415 to i32
  %417 = xor i32 %416, -1
  %418 = xor i32 %414, -1
  %419 = xor i32 521263571, -1
  %420 = and i32 %417, 521263571
  %421 = and i32 %416, %419
  %422 = and i32 %418, 521263571
  %423 = and i32 %414, %419
  %424 = or i32 %420, %421
  %425 = or i32 %422, %423
  %426 = xor i32 %424, %425
  %427 = or i32 %417, %418
  %428 = xor i32 %427, -1
  %429 = or i32 521263571, %419
  %430 = and i32 %428, %429
  %431 = or i32 %426, %430
  %432 = or i32 %416, %414
  %433 = trunc i32 %431 to i8
  store i8 %433, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %434 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %435 = load i8* %434, align 1
  %436 = zext i8 %435 to i32
  %437 = xor i32 1865415877, -1
  %438 = or i32 %436, 1865415877
  %439 = or i32 1, 1865415877
  %440 = or i32 %436, %437
  %441 = or i32 1, %437
  %442 = and i32 %438, %439
  %443 = and i32 %442, %440
  %444 = and i32 %443, %441
  %445 = and i32 %436, 1
  %446 = shl i32 %444, 3
  %447 = load i8* %column, align 1
  %448 = zext i8 %447 to i32
  %449 = and i32 %448, %446
  %450 = xor i32 %448, %446
  %451 = or i32 %449, %450
  %452 = or i32 %448, %446
  %453 = trunc i32 %451 to i8
  store i8 %453, i8* %column, align 1
  %454 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %455 = load i8* %454, align 1
  %456 = zext i8 %455 to i32
  %457 = xor i32 -2001388081, -1
  %458 = or i32 %456, -2001388081
  %459 = or i32 224, -2001388081
  %460 = or i32 %456, %457
  %461 = or i32 224, %457
  %462 = and i32 %458, %459
  %463 = and i32 %462, %460
  %464 = and i32 %463, %461
  %465 = and i32 %456, 224
  %466 = ashr i32 %464, 5
  %467 = load i8* %column, align 1
  %468 = zext i8 %467 to i32
  %469 = and i32 %468, %466
  %470 = xor i32 %468, %466
  %471 = or i32 %469, %470
  %472 = or i32 %468, %466
  %473 = trunc i32 %471 to i8
  store i8 %473, i8* %column, align 1
  %474 = load i8* %row, align 1
  %475 = zext i8 %474 to i32
  %476 = mul nsw i32 %475, 16
  %477 = load i8* %column, align 1
  %478 = zext i8 %477 to i32
  %479 = xor i32 %476, %478
  %480 = and i32 %476, %478
  %481 = add i32 %480, %480
  %482 = add nsw i32 %479, %481
  %483 = add nsw i32 %476, %478
  %484 = sext i32 %482 to i64
  %485 = getelementptr inbounds [64 x i32]* @S2, i32 0, i64 %484
  %486 = load i32* %485, align 4
  %487 = trunc i32 %486 to i8
  %488 = zext i8 %487 to i32
  %489 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %490 = load i8* %489, align 1
  %491 = zext i8 %490 to i32
  %492 = xor i32 %491, -1
  %493 = xor i32 %488, -1
  %494 = xor i32 -1669451870, -1
  %495 = and i32 %492, -1669451870
  %496 = and i32 %491, %494
  %497 = and i32 %493, -1669451870
  %498 = and i32 %488, %494
  %499 = or i32 %495, %496
  %500 = or i32 %497, %498
  %501 = xor i32 %499, %500
  %502 = or i32 %492, %493
  %503 = xor i32 %502, -1
  %504 = or i32 -1669451870, %494
  %505 = and i32 %503, %504
  %506 = or i32 %501, %505
  %507 = or i32 %491, %488
  %508 = trunc i32 %506 to i8
  store i8 %508, i8* %489, align 1
  store i8 0, i8* %row, align 1
  %509 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %510 = load i8* %509, align 1
  %511 = zext i8 %510 to i32
  %512 = xor i32 -1055811228, -1
  %513 = or i32 %511, -1055811228
  %514 = or i32 8, -1055811228
  %515 = or i32 %511, %512
  %516 = or i32 8, %512
  %517 = and i32 %513, %514
  %518 = and i32 %517, %515
  %519 = and i32 %518, %516
  %520 = and i32 %511, 8
  %521 = ashr i32 %519, 2
  %522 = load i8* %row, align 1
  %523 = zext i8 %522 to i32
  %524 = and i32 %523, %521
  %525 = xor i32 %523, %521
  %526 = or i32 %524, %525
  %527 = or i32 %523, %521
  %528 = trunc i32 %526 to i8
  store i8 %528, i8* %row, align 1
  %529 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %530 = load i8* %529, align 1
  %531 = zext i8 %530 to i32
  %532 = xor i32 -220608403, -1
  %533 = or i32 %531, -220608403
  %534 = or i32 64, -220608403
  %535 = or i32 %531, %532
  %536 = or i32 64, %532
  %537 = and i32 %533, %534
  %538 = and i32 %537, %535
  %539 = and i32 %538, %536
  %540 = and i32 %531, 64
  %541 = ashr i32 %539, 6
  %542 = load i8* %row, align 1
  %543 = zext i8 %542 to i32
  %544 = and i32 %543, %541
  %545 = xor i32 %543, %541
  %546 = or i32 %544, %545
  %547 = or i32 %543, %541
  %548 = trunc i32 %546 to i8
  store i8 %548, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %549 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %550 = load i8* %549, align 1
  %551 = zext i8 %550 to i32
  %552 = xor i32 1759994168, -1
  %553 = or i32 %551, 1759994168
  %554 = or i32 7, 1759994168
  %555 = or i32 %551, %552
  %556 = or i32 7, %552
  %557 = and i32 %553, %554
  %558 = and i32 %557, %555
  %559 = and i32 %558, %556
  %560 = and i32 %551, 7
  %561 = shl i32 %559, 1
  %562 = load i8* %column, align 1
  %563 = zext i8 %562 to i32
  %564 = xor i32 %563, -1
  %565 = xor i32 %561, -1
  %566 = xor i32 2023002234, -1
  %567 = and i32 %564, 2023002234
  %568 = and i32 %563, %566
  %569 = and i32 %565, 2023002234
  %570 = and i32 %561, %566
  %571 = or i32 %567, %568
  %572 = or i32 %569, %570
  %573 = xor i32 %571, %572
  %574 = or i32 %564, %565
  %575 = xor i32 %574, -1
  %576 = or i32 2023002234, %566
  %577 = and i32 %575, %576
  %578 = or i32 %573, %577
  %579 = or i32 %563, %561
  %580 = trunc i32 %578 to i8
  store i8 %580, i8* %column, align 1
  %581 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %582 = load i8* %581, align 1
  %583 = zext i8 %582 to i32
  %584 = xor i32 -90275277, -1
  %585 = or i32 %583, -90275277
  %586 = or i32 128, -90275277
  %587 = or i32 %583, %584
  %588 = or i32 128, %584
  %589 = and i32 %585, %586
  %590 = and i32 %589, %587
  %591 = and i32 %590, %588
  %592 = and i32 %583, 128
  %593 = ashr i32 %591, 7
  %594 = load i8* %column, align 1
  %595 = zext i8 %594 to i32
  %596 = xor i32 %595, -1
  %597 = xor i32 %593, -1
  %598 = xor i32 501021709, -1
  %599 = and i32 %596, 501021709
  %600 = and i32 %595, %598
  %601 = and i32 %597, 501021709
  %602 = and i32 %593, %598
  %603 = or i32 %599, %600
  %604 = or i32 %601, %602
  %605 = xor i32 %603, %604
  %606 = or i32 %596, %597
  %607 = xor i32 %606, -1
  %608 = or i32 501021709, %598
  %609 = and i32 %607, %608
  %610 = or i32 %605, %609
  %611 = or i32 %595, %593
  %612 = trunc i32 %610 to i8
  store i8 %612, i8* %column, align 1
  %613 = load i8* %row, align 1
  %614 = zext i8 %613 to i32
  %615 = mul nsw i32 %614, 16
  %616 = load i8* %column, align 1
  %617 = zext i8 %616 to i32
  %618 = xor i32 %615, %617
  %619 = and i32 %615, %617
  %620 = add i32 %619, %619
  %621 = add nsw i32 %618, %620
  %622 = add nsw i32 %615, %617
  %623 = sext i32 %621 to i64
  %624 = getelementptr inbounds [64 x i32]* @S3, i32 0, i64 %623
  %625 = load i32* %624, align 4
  %626 = trunc i32 %625 to i8
  %627 = zext i8 %626 to i32
  %628 = shl i32 %627, 4
  %629 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %630 = load i8* %629, align 1
  %631 = zext i8 %630 to i32
  %632 = xor i32 %631, -1
  %633 = xor i32 %628, -1
  %634 = xor i32 -1084409819, -1
  %635 = and i32 %632, -1084409819
  %636 = and i32 %631, %634
  %637 = and i32 %633, -1084409819
  %638 = and i32 %628, %634
  %639 = or i32 %635, %636
  %640 = or i32 %637, %638
  %641 = xor i32 %639, %640
  %642 = or i32 %632, %633
  %643 = xor i32 %642, -1
  %644 = or i32 -1084409819, %634
  %645 = and i32 %643, %644
  %646 = or i32 %641, %645
  %647 = or i32 %631, %628
  %648 = trunc i32 %646 to i8
  store i8 %648, i8* %629, align 1
  store i8 0, i8* %row, align 1
  %649 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %650 = load i8* %649, align 1
  %651 = zext i8 %650 to i32
  %652 = xor i32 1282999550, -1
  %653 = or i32 %651, 1282999550
  %654 = or i32 32, 1282999550
  %655 = or i32 %651, %652
  %656 = or i32 32, %652
  %657 = and i32 %653, %654
  %658 = and i32 %657, %655
  %659 = and i32 %658, %656
  %660 = and i32 %651, 32
  %661 = ashr i32 %659, 4
  %662 = load i8* %row, align 1
  %663 = zext i8 %662 to i32
  %664 = xor i32 %663, -1
  %665 = xor i32 %661, -1
  %666 = xor i32 -2039643049, -1
  %667 = and i32 %664, -2039643049
  %668 = and i32 %663, %666
  %669 = and i32 %665, -2039643049
  %670 = and i32 %661, %666
  %671 = or i32 %667, %668
  %672 = or i32 %669, %670
  %673 = xor i32 %671, %672
  %674 = or i32 %664, %665
  %675 = xor i32 %674, -1
  %676 = or i32 -2039643049, %666
  %677 = and i32 %675, %676
  %678 = or i32 %673, %677
  %679 = or i32 %663, %661
  %680 = trunc i32 %678 to i8
  store i8 %680, i8* %row, align 1
  %681 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %682 = load i8* %681, align 1
  %683 = zext i8 %682 to i32
  %684 = xor i32 -811043717, -1
  %685 = or i32 %683, -811043717
  %686 = or i32 1, -811043717
  %687 = or i32 %683, %684
  %688 = or i32 1, %684
  %689 = and i32 %685, %686
  %690 = and i32 %689, %687
  %691 = and i32 %690, %688
  %692 = and i32 %683, 1
  %693 = load i8* %row, align 1
  %694 = zext i8 %693 to i32
  %695 = and i32 %694, %691
  %696 = xor i32 %694, %691
  %697 = or i32 %695, %696
  %698 = or i32 %694, %691
  %699 = trunc i32 %697 to i8
  store i8 %699, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %700 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %701 = load i8* %700, align 1
  %702 = zext i8 %701 to i32
  %703 = xor i32 -880497333, -1
  %704 = or i32 %702, -880497333
  %705 = or i32 30, -880497333
  %706 = or i32 %702, %703
  %707 = or i32 30, %703
  %708 = and i32 %704, %705
  %709 = and i32 %708, %706
  %710 = and i32 %709, %707
  %711 = and i32 %702, 30
  %712 = ashr i32 %710, 1
  %713 = load i8* %column, align 1
  %714 = zext i8 %713 to i32
  %715 = xor i32 %714, -1
  %716 = xor i32 %712, -1
  %717 = xor i32 1444826906, -1
  %718 = and i32 %715, 1444826906
  %719 = and i32 %714, %717
  %720 = and i32 %716, 1444826906
  %721 = and i32 %712, %717
  %722 = or i32 %718, %719
  %723 = or i32 %720, %721
  %724 = xor i32 %722, %723
  %725 = or i32 %715, %716
  %726 = xor i32 %725, -1
  %727 = or i32 1444826906, %717
  %728 = and i32 %726, %727
  %729 = or i32 %724, %728
  %730 = or i32 %714, %712
  %731 = trunc i32 %729 to i8
  store i8 %731, i8* %column, align 1
  %732 = load i8* %row, align 1
  %733 = zext i8 %732 to i32
  %734 = mul nsw i32 %733, 16
  %735 = load i8* %column, align 1
  %736 = zext i8 %735 to i32
  %737 = xor i32 %734, %736
  %738 = and i32 %734, %736
  %739 = add i32 %738, %738
  %740 = add nsw i32 %737, %739
  %741 = add nsw i32 %734, %736
  %742 = sext i32 %740 to i64
  %743 = getelementptr inbounds [64 x i32]* @S4, i32 0, i64 %742
  %744 = load i32* %743, align 4
  %745 = trunc i32 %744 to i8
  %746 = zext i8 %745 to i32
  %747 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %748 = load i8* %747, align 1
  %749 = zext i8 %748 to i32
  %750 = and i32 %749, %746
  %751 = xor i32 %749, %746
  %752 = or i32 %750, %751
  %753 = or i32 %749, %746
  %754 = trunc i32 %752 to i8
  store i8 %754, i8* %747, align 1
  store i8 0, i8* %row, align 1
  %755 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %756 = load i8* %755, align 1
  %757 = zext i8 %756 to i32
  %758 = xor i32 -275856883, -1
  %759 = or i32 %757, -275856883
  %760 = or i32 128, -275856883
  %761 = or i32 %757, %758
  %762 = or i32 128, %758
  %763 = and i32 %759, %760
  %764 = and i32 %763, %761
  %765 = and i32 %764, %762
  %766 = and i32 %757, 128
  %767 = ashr i32 %765, 6
  %768 = load i8* %row, align 1
  %769 = zext i8 %768 to i32
  %770 = and i32 %769, %767
  %771 = xor i32 %769, %767
  %772 = or i32 %770, %771
  %773 = or i32 %769, %767
  %774 = trunc i32 %772 to i8
  store i8 %774, i8* %row, align 1
  %775 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %776 = load i8* %775, align 1
  %777 = zext i8 %776 to i32
  %778 = xor i32 27872131, -1
  %779 = or i32 %777, 27872131
  %780 = or i32 4, 27872131
  %781 = or i32 %777, %778
  %782 = or i32 4, %778
  %783 = and i32 %779, %780
  %784 = and i32 %783, %781
  %785 = and i32 %784, %782
  %786 = and i32 %777, 4
  %787 = ashr i32 %785, 2
  %788 = load i8* %row, align 1
  %789 = zext i8 %788 to i32
  %790 = xor i32 %789, -1
  %791 = xor i32 %787, -1
  %792 = xor i32 1301787101, -1
  %793 = and i32 %790, 1301787101
  %794 = and i32 %789, %792
  %795 = and i32 %791, 1301787101
  %796 = and i32 %787, %792
  %797 = or i32 %793, %794
  %798 = or i32 %795, %796
  %799 = xor i32 %797, %798
  %800 = or i32 %790, %791
  %801 = xor i32 %800, -1
  %802 = or i32 1301787101, %792
  %803 = and i32 %801, %802
  %804 = or i32 %799, %803
  %805 = or i32 %789, %787
  %806 = trunc i32 %804 to i8
  store i8 %806, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %807 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %808 = load i8* %807, align 1
  %809 = zext i8 %808 to i32
  %810 = xor i32 1062717595, -1
  %811 = or i32 %809, 1062717595
  %812 = or i32 120, 1062717595
  %813 = or i32 %809, %810
  %814 = or i32 120, %810
  %815 = and i32 %811, %812
  %816 = and i32 %815, %813
  %817 = and i32 %816, %814
  %818 = and i32 %809, 120
  %819 = ashr i32 %817, 3
  %820 = load i8* %column, align 1
  %821 = zext i8 %820 to i32
  %822 = xor i32 %821, -1
  %823 = xor i32 %819, -1
  %824 = xor i32 -1745935086, -1
  %825 = and i32 %822, -1745935086
  %826 = and i32 %821, %824
  %827 = and i32 %823, -1745935086
  %828 = and i32 %819, %824
  %829 = or i32 %825, %826
  %830 = or i32 %827, %828
  %831 = xor i32 %829, %830
  %832 = or i32 %822, %823
  %833 = xor i32 %832, -1
  %834 = or i32 -1745935086, %824
  %835 = and i32 %833, %834
  %836 = or i32 %831, %835
  %837 = or i32 %821, %819
  %838 = trunc i32 %836 to i8
  store i8 %838, i8* %column, align 1
  %839 = load i8* %row, align 1
  %840 = zext i8 %839 to i32
  %841 = mul nsw i32 %840, 16
  %842 = load i8* %column, align 1
  %843 = zext i8 %842 to i32
  %844 = xor i32 %841, %843
  %845 = and i32 %841, %843
  %846 = add i32 %845, %845
  %847 = add nsw i32 %844, %846
  %848 = add nsw i32 %841, %843
  %849 = sext i32 %847 to i64
  %850 = getelementptr inbounds [64 x i32]* @S5, i32 0, i64 %849
  %851 = load i32* %850, align 4
  %852 = trunc i32 %851 to i8
  %853 = zext i8 %852 to i32
  %854 = shl i32 %853, 4
  %855 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %856 = load i8* %855, align 1
  %857 = zext i8 %856 to i32
  %858 = xor i32 %857, -1
  %859 = xor i32 %854, -1
  %860 = xor i32 1835182909, -1
  %861 = and i32 %858, 1835182909
  %862 = and i32 %857, %860
  %863 = and i32 %859, 1835182909
  %864 = and i32 %854, %860
  %865 = or i32 %861, %862
  %866 = or i32 %863, %864
  %867 = xor i32 %865, %866
  %868 = or i32 %858, %859
  %869 = xor i32 %868, -1
  %870 = or i32 1835182909, %860
  %871 = and i32 %869, %870
  %872 = or i32 %867, %871
  %873 = or i32 %857, %854
  %874 = trunc i32 %872 to i8
  store i8 %874, i8* %855, align 1
  store i8 0, i8* %row, align 1
  %875 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %876 = load i8* %875, align 1
  %877 = zext i8 %876 to i32
  %878 = xor i32 763852479, -1
  %879 = or i32 %877, 763852479
  %880 = or i32 2, 763852479
  %881 = or i32 %877, %878
  %882 = or i32 2, %878
  %883 = and i32 %879, %880
  %884 = and i32 %883, %881
  %885 = and i32 %884, %882
  %886 = and i32 %877, 2
  %887 = load i8* %row, align 1
  %888 = zext i8 %887 to i32
  %889 = xor i32 %888, -1
  %890 = xor i32 %885, -1
  %891 = xor i32 1994500899, -1
  %892 = and i32 %889, 1994500899
  %893 = and i32 %888, %891
  %894 = and i32 %890, 1994500899
  %895 = and i32 %885, %891
  %896 = or i32 %892, %893
  %897 = or i32 %894, %895
  %898 = xor i32 %896, %897
  %899 = or i32 %889, %890
  %900 = xor i32 %899, -1
  %901 = or i32 1994500899, %891
  %902 = and i32 %900, %901
  %903 = or i32 %898, %902
  %904 = or i32 %888, %885
  %905 = trunc i32 %903 to i8
  store i8 %905, i8* %row, align 1
  %906 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %907 = load i8* %906, align 1
  %908 = zext i8 %907 to i32
  %909 = xor i32 1510944983, -1
  %910 = or i32 %908, 1510944983
  %911 = or i32 16, 1510944983
  %912 = or i32 %908, %909
  %913 = or i32 16, %909
  %914 = and i32 %910, %911
  %915 = and i32 %914, %912
  %916 = and i32 %915, %913
  %917 = and i32 %908, 16
  %918 = ashr i32 %916, 4
  %919 = load i8* %row, align 1
  %920 = zext i8 %919 to i32
  %921 = and i32 %920, %918
  %922 = xor i32 %920, %918
  %923 = or i32 %921, %922
  %924 = or i32 %920, %918
  %925 = trunc i32 %923 to i8
  store i8 %925, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %926 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %927 = load i8* %926, align 1
  %928 = zext i8 %927 to i32
  %929 = xor i32 -830160146, -1
  %930 = or i32 %928, -830160146
  %931 = or i32 1, -830160146
  %932 = or i32 %928, %929
  %933 = or i32 1, %929
  %934 = and i32 %930, %931
  %935 = and i32 %934, %932
  %936 = and i32 %935, %933
  %937 = and i32 %928, 1
  %938 = shl i32 %936, 3
  %939 = load i8* %column, align 1
  %940 = zext i8 %939 to i32
  %941 = xor i32 %940, -1
  %942 = xor i32 %938, -1
  %943 = xor i32 1972840314, -1
  %944 = and i32 %941, 1972840314
  %945 = and i32 %940, %943
  %946 = and i32 %942, 1972840314
  %947 = and i32 %938, %943
  %948 = or i32 %944, %945
  %949 = or i32 %946, %947
  %950 = xor i32 %948, %949
  %951 = or i32 %941, %942
  %952 = xor i32 %951, -1
  %953 = or i32 1972840314, %943
  %954 = and i32 %952, %953
  %955 = or i32 %950, %954
  %956 = or i32 %940, %938
  %957 = trunc i32 %955 to i8
  store i8 %957, i8* %column, align 1
  %958 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %959 = load i8* %958, align 1
  %960 = zext i8 %959 to i32
  %961 = xor i32 -887633980, -1
  %962 = or i32 %960, -887633980
  %963 = or i32 224, -887633980
  %964 = or i32 %960, %961
  %965 = or i32 224, %961
  %966 = and i32 %962, %963
  %967 = and i32 %966, %964
  %968 = and i32 %967, %965
  %969 = and i32 %960, 224
  %970 = ashr i32 %968, 5
  %971 = load i8* %column, align 1
  %972 = zext i8 %971 to i32
  %973 = and i32 %972, %970
  %974 = xor i32 %972, %970
  %975 = or i32 %973, %974
  %976 = or i32 %972, %970
  %977 = trunc i32 %975 to i8
  store i8 %977, i8* %column, align 1
  %978 = load i8* %row, align 1
  %979 = zext i8 %978 to i32
  %980 = mul nsw i32 %979, 16
  %981 = load i8* %column, align 1
  %982 = zext i8 %981 to i32
  %983 = xor i32 %980, %982
  %984 = and i32 %980, %982
  %985 = add i32 %984, %984
  %986 = add nsw i32 %983, %985
  %987 = add nsw i32 %980, %982
  %988 = sext i32 %986 to i64
  %989 = getelementptr inbounds [64 x i32]* @S6, i32 0, i64 %988
  %990 = load i32* %989, align 4
  %991 = trunc i32 %990 to i8
  %992 = zext i8 %991 to i32
  %993 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %994 = load i8* %993, align 1
  %995 = zext i8 %994 to i32
  %996 = and i32 %995, %992
  %997 = xor i32 %995, %992
  %998 = or i32 %996, %997
  %999 = or i32 %995, %992
  %1000 = trunc i32 %998 to i8
  store i8 %1000, i8* %993, align 1
  store i8 0, i8* %row, align 1
  %1001 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %1002 = load i8* %1001, align 1
  %1003 = zext i8 %1002 to i32
  %1004 = xor i32 1958891213, -1
  %1005 = or i32 %1003, 1958891213
  %1006 = or i32 8, 1958891213
  %1007 = or i32 %1003, %1004
  %1008 = or i32 8, %1004
  %1009 = and i32 %1005, %1006
  %1010 = and i32 %1009, %1007
  %1011 = and i32 %1010, %1008
  %1012 = and i32 %1003, 8
  %1013 = ashr i32 %1011, 2
  %1014 = load i8* %row, align 1
  %1015 = zext i8 %1014 to i32
  %1016 = and i32 %1015, %1013
  %1017 = xor i32 %1015, %1013
  %1018 = or i32 %1016, %1017
  %1019 = or i32 %1015, %1013
  %1020 = trunc i32 %1018 to i8
  store i8 %1020, i8* %row, align 1
  %1021 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1022 = load i8* %1021, align 1
  %1023 = zext i8 %1022 to i32
  %1024 = xor i32 1008922684, -1
  %1025 = or i32 %1023, 1008922684
  %1026 = or i32 64, 1008922684
  %1027 = or i32 %1023, %1024
  %1028 = or i32 64, %1024
  %1029 = and i32 %1025, %1026
  %1030 = and i32 %1029, %1027
  %1031 = and i32 %1030, %1028
  %1032 = and i32 %1023, 64
  %1033 = ashr i32 %1031, 6
  %1034 = load i8* %row, align 1
  %1035 = zext i8 %1034 to i32
  %1036 = and i32 %1035, %1033
  %1037 = xor i32 %1035, %1033
  %1038 = or i32 %1036, %1037
  %1039 = or i32 %1035, %1033
  %1040 = trunc i32 %1038 to i8
  store i8 %1040, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1041 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %1042 = load i8* %1041, align 1
  %1043 = zext i8 %1042 to i32
  %1044 = xor i32 1777366843, -1
  %1045 = or i32 %1043, 1777366843
  %1046 = or i32 7, 1777366843
  %1047 = or i32 %1043, %1044
  %1048 = or i32 7, %1044
  %1049 = and i32 %1045, %1046
  %1050 = and i32 %1049, %1047
  %1051 = and i32 %1050, %1048
  %1052 = and i32 %1043, 7
  %1053 = shl i32 %1051, 1
  %1054 = load i8* %column, align 1
  %1055 = zext i8 %1054 to i32
  %1056 = xor i32 %1055, -1
  %1057 = xor i32 %1053, -1
  %1058 = xor i32 -1645752464, -1
  %1059 = and i32 %1056, -1645752464
  %1060 = and i32 %1055, %1058
  %1061 = and i32 %1057, -1645752464
  %1062 = and i32 %1053, %1058
  %1063 = or i32 %1059, %1060
  %1064 = or i32 %1061, %1062
  %1065 = xor i32 %1063, %1064
  %1066 = or i32 %1056, %1057
  %1067 = xor i32 %1066, -1
  %1068 = or i32 -1645752464, %1058
  %1069 = and i32 %1067, %1068
  %1070 = or i32 %1065, %1069
  %1071 = or i32 %1055, %1053
  %1072 = trunc i32 %1070 to i8
  store i8 %1072, i8* %column, align 1
  %1073 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1074 = load i8* %1073, align 1
  %1075 = zext i8 %1074 to i32
  %1076 = xor i32 1655745497, -1
  %1077 = or i32 %1075, 1655745497
  %1078 = or i32 128, 1655745497
  %1079 = or i32 %1075, %1076
  %1080 = or i32 128, %1076
  %1081 = and i32 %1077, %1078
  %1082 = and i32 %1081, %1079
  %1083 = and i32 %1082, %1080
  %1084 = and i32 %1075, 128
  %1085 = ashr i32 %1083, 7
  %1086 = load i8* %column, align 1
  %1087 = zext i8 %1086 to i32
  %1088 = and i32 %1087, %1085
  %1089 = xor i32 %1087, %1085
  %1090 = or i32 %1088, %1089
  %1091 = or i32 %1087, %1085
  %1092 = trunc i32 %1090 to i8
  store i8 %1092, i8* %column, align 1
  %1093 = load i8* %row, align 1
  %1094 = zext i8 %1093 to i32
  %1095 = mul nsw i32 %1094, 16
  %1096 = load i8* %column, align 1
  %1097 = zext i8 %1096 to i32
  %1098 = xor i32 %1095, %1097
  %1099 = and i32 %1095, %1097
  %1100 = add i32 %1099, %1099
  %1101 = add nsw i32 %1098, %1100
  %1102 = add nsw i32 %1095, %1097
  %1103 = sext i32 %1101 to i64
  %1104 = getelementptr inbounds [64 x i32]* @S7, i32 0, i64 %1103
  %1105 = load i32* %1104, align 4
  %1106 = trunc i32 %1105 to i8
  %1107 = zext i8 %1106 to i32
  %1108 = shl i32 %1107, 4
  %1109 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1110 = load i8* %1109, align 1
  %1111 = zext i8 %1110 to i32
  %1112 = and i32 %1111, %1108
  %1113 = xor i32 %1111, %1108
  %1114 = or i32 %1112, %1113
  %1115 = or i32 %1111, %1108
  %1116 = trunc i32 %1114 to i8
  store i8 %1116, i8* %1109, align 1
  store i8 0, i8* %row, align 1
  %1117 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1118 = load i8* %1117, align 1
  %1119 = zext i8 %1118 to i32
  %1120 = xor i32 -211540496, -1
  %1121 = or i32 %1119, -211540496
  %1122 = or i32 32, -211540496
  %1123 = or i32 %1119, %1120
  %1124 = or i32 32, %1120
  %1125 = and i32 %1121, %1122
  %1126 = and i32 %1125, %1123
  %1127 = and i32 %1126, %1124
  %1128 = and i32 %1119, 32
  %1129 = ashr i32 %1127, 4
  %1130 = load i8* %row, align 1
  %1131 = zext i8 %1130 to i32
  %1132 = and i32 %1131, %1129
  %1133 = xor i32 %1131, %1129
  %1134 = or i32 %1132, %1133
  %1135 = or i32 %1131, %1129
  %1136 = trunc i32 %1134 to i8
  store i8 %1136, i8* %row, align 1
  %1137 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1138 = load i8* %1137, align 1
  %1139 = zext i8 %1138 to i32
  %1140 = xor i32 44203206, -1
  %1141 = or i32 %1139, 44203206
  %1142 = or i32 1, 44203206
  %1143 = or i32 %1139, %1140
  %1144 = or i32 1, %1140
  %1145 = and i32 %1141, %1142
  %1146 = and i32 %1145, %1143
  %1147 = and i32 %1146, %1144
  %1148 = and i32 %1139, 1
  %1149 = load i8* %row, align 1
  %1150 = zext i8 %1149 to i32
  %1151 = xor i32 %1150, -1
  %1152 = xor i32 %1147, -1
  %1153 = xor i32 100019224, -1
  %1154 = and i32 %1151, 100019224
  %1155 = and i32 %1150, %1153
  %1156 = and i32 %1152, 100019224
  %1157 = and i32 %1147, %1153
  %1158 = or i32 %1154, %1155
  %1159 = or i32 %1156, %1157
  %1160 = xor i32 %1158, %1159
  %1161 = or i32 %1151, %1152
  %1162 = xor i32 %1161, -1
  %1163 = or i32 100019224, %1153
  %1164 = and i32 %1162, %1163
  %1165 = or i32 %1160, %1164
  %1166 = or i32 %1150, %1147
  %1167 = trunc i32 %1165 to i8
  store i8 %1167, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1168 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1169 = load i8* %1168, align 1
  %1170 = zext i8 %1169 to i32
  %1171 = xor i32 -1402528531, -1
  %1172 = or i32 %1170, -1402528531
  %1173 = or i32 30, -1402528531
  %1174 = or i32 %1170, %1171
  %1175 = or i32 30, %1171
  %1176 = and i32 %1172, %1173
  %1177 = and i32 %1176, %1174
  %1178 = and i32 %1177, %1175
  %1179 = and i32 %1170, 30
  %1180 = ashr i32 %1178, 1
  %1181 = load i8* %column, align 1
  %1182 = zext i8 %1181 to i32
  %1183 = and i32 %1182, %1180
  %1184 = xor i32 %1182, %1180
  %1185 = or i32 %1183, %1184
  %1186 = or i32 %1182, %1180
  %1187 = trunc i32 %1185 to i8
  store i8 %1187, i8* %column, align 1
  %1188 = load i8* %row, align 1
  %1189 = zext i8 %1188 to i32
  %1190 = mul nsw i32 %1189, 16
  %1191 = load i8* %column, align 1
  %1192 = zext i8 %1191 to i32
  %1193 = xor i32 %1190, %1192
  %1194 = and i32 %1190, %1192
  %1195 = add i32 %1194, %1194
  %1196 = add nsw i32 %1193, %1195
  %1197 = add nsw i32 %1190, %1192
  %1198 = sext i32 %1196 to i64
  %1199 = getelementptr inbounds [64 x i32]* @S8, i32 0, i64 %1198
  %1200 = load i32* %1199, align 4
  %1201 = trunc i32 %1200 to i8
  %1202 = zext i8 %1201 to i32
  %1203 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1204 = load i8* %1203, align 1
  %1205 = zext i8 %1204 to i32
  %1206 = xor i32 %1205, -1
  %1207 = xor i32 %1202, -1
  %1208 = xor i32 -1189378946, -1
  %1209 = and i32 %1206, -1189378946
  %1210 = and i32 %1205, %1208
  %1211 = and i32 %1207, -1189378946
  %1212 = and i32 %1202, %1208
  %1213 = or i32 %1209, %1210
  %1214 = or i32 %1211, %1212
  %1215 = xor i32 %1213, %1214
  %1216 = or i32 %1206, %1207
  %1217 = xor i32 %1216, -1
  %1218 = or i32 -1189378946, %1208
  %1219 = and i32 %1217, %1218
  %1220 = or i32 %1215, %1219
  %1221 = or i32 %1205, %1202
  %1222 = trunc i32 %1220 to i8
  store i8 %1222, i8* %1203, align 1
  store i32 0, i32* %i, align 4
  br label %1223

; <label>:1223                                    ; preds = %1230, %262
  %1224 = load i32* %i, align 4
  %1225 = icmp slt i32 %1224, 4
  br i1 %1225, label %1226, label %1237

; <label>:1226                                    ; preds = %1223
  %1227 = load i32* %i, align 4
  %1228 = sext i32 %1227 to i64
  %1229 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1228
  store i8 0, i8* %1229, align 1
  br label %1230

; <label>:1230                                    ; preds = %1226
  %1231 = load i32* %i, align 4
  %1232 = xor i32 %1231, 1
  %1233 = and i32 %1231, 1
  %1234 = add i32 %1233, %1233
  %1235 = add nsw i32 %1232, %1234
  %1236 = add nsw i32 %1231, 1
  store i32 %1235, i32* %i, align 4
  br label %1223

; <label>:1237                                    ; preds = %1223
  store i32 0, i32* %i, align 4
  br label %1238

; <label>:1238                                    ; preds = %1320, %1237
  %1239 = load i32* %i, align 4
  %1240 = icmp slt i32 %1239, 32
  br i1 %1240, label %1241, label %1327

; <label>:1241                                    ; preds = %1238
  %1242 = load i32* %i, align 4
  %1243 = sext i32 %1242 to i64
  %1244 = getelementptr inbounds [32 x i32]* @right_sub_message_permutation, i32 0, i64 %1243
  %1245 = load i32* %1244, align 4
  store i32 %1245, i32* %shift_size, align 4
  %1246 = load i32* %shift_size, align 4
  %1247 = sub i32 0, 1
  %1248 = xor i32 %1246, %1247
  %1249 = and i32 %1246, %1247
  %1250 = add i32 %1249, %1249
  %1251 = add nsw i32 %1248, %1250
  %1252 = sub nsw i32 %1246, 1
  %1253 = srem i32 %1251, 8
  %1254 = ashr i32 128, %1253
  %1255 = trunc i32 %1254 to i8
  store i8 %1255, i8* %shift_byte, align 1
  %1256 = load i32* %shift_size, align 4
  %1257 = sub i32 0, 1
  %1258 = xor i32 %1256, %1257
  %1259 = and i32 %1256, %1257
  %1260 = add i32 %1259, %1259
  %1261 = add nsw i32 %1258, %1260
  %1262 = sub nsw i32 %1256, 1
  %1263 = sdiv i32 %1261, 8
  %1264 = sext i32 %1263 to i64
  %1265 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %1264
  %1266 = load i8* %1265, align 1
  %1267 = zext i8 %1266 to i32
  %1268 = load i8* %shift_byte, align 1
  %1269 = zext i8 %1268 to i32
  %1270 = xor i32 -585228323, -1
  %1271 = or i32 %1269, -585228323
  %1272 = or i32 %1267, -585228323
  %1273 = or i32 %1269, %1270
  %1274 = or i32 %1267, %1270
  %1275 = and i32 %1271, %1272
  %1276 = and i32 %1275, %1273
  %1277 = and i32 %1276, %1274
  %1278 = and i32 %1269, %1267
  %1279 = trunc i32 %1277 to i8
  store i8 %1279, i8* %shift_byte, align 1
  %1280 = load i32* %shift_size, align 4
  %1281 = sub i32 0, 1
  %1282 = xor i32 %1280, %1281
  %1283 = and i32 %1280, %1281
  %1284 = add i32 %1283, %1283
  %1285 = add nsw i32 %1282, %1284
  %1286 = sub nsw i32 %1280, 1
  %1287 = srem i32 %1285, 8
  %1288 = load i8* %shift_byte, align 1
  %1289 = zext i8 %1288 to i32
  %1290 = shl i32 %1289, %1287
  %1291 = trunc i32 %1290 to i8
  store i8 %1291, i8* %shift_byte, align 1
  %1292 = load i8* %shift_byte, align 1
  %1293 = zext i8 %1292 to i32
  %1294 = load i32* %i, align 4
  %1295 = srem i32 %1294, 8
  %1296 = ashr i32 %1293, %1295
  %1297 = load i32* %i, align 4
  %1298 = sdiv i32 %1297, 8
  %1299 = sext i32 %1298 to i64
  %1300 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1299
  %1301 = load i8* %1300, align 1
  %1302 = zext i8 %1301 to i32
  %1303 = xor i32 %1302, -1
  %1304 = xor i32 %1296, -1
  %1305 = xor i32 548780995, -1
  %1306 = and i32 %1303, 548780995
  %1307 = and i32 %1302, %1305
  %1308 = and i32 %1304, 548780995
  %1309 = and i32 %1296, %1305
  %1310 = or i32 %1306, %1307
  %1311 = or i32 %1308, %1309
  %1312 = xor i32 %1310, %1311
  %1313 = or i32 %1303, %1304
  %1314 = xor i32 %1313, -1
  %1315 = or i32 548780995, %1305
  %1316 = and i32 %1314, %1315
  %1317 = or i32 %1312, %1316
  %1318 = or i32 %1302, %1296
  %1319 = trunc i32 %1317 to i8
  store i8 %1319, i8* %1300, align 1
  br label %1320

; <label>:1320                                    ; preds = %1241
  %1321 = load i32* %i, align 4
  %1322 = xor i32 %1321, 1
  %1323 = and i32 %1321, 1
  %1324 = add i32 %1323, %1323
  %1325 = add nsw i32 %1322, %1324
  %1326 = add nsw i32 %1321, 1
  store i32 %1325, i32* %i, align 4
  br label %1238

; <label>:1327                                    ; preds = %1238
  store i32 0, i32* %i, align 4
  br label %1328

; <label>:1328                                    ; preds = %1348, %1327
  %1329 = load i32* %i, align 4
  %1330 = icmp slt i32 %1329, 4
  br i1 %1330, label %1331, label %1355

; <label>:1331                                    ; preds = %1328
  %1332 = load i32* %i, align 4
  %1333 = sext i32 %1332 to i64
  %1334 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1333
  %1335 = load i8* %1334, align 1
  %1336 = zext i8 %1335 to i32
  %1337 = load i32* %i, align 4
  %1338 = sext i32 %1337 to i64
  %1339 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1338
  %1340 = load i8* %1339, align 1
  %1341 = zext i8 %1340 to i32
  %1342 = and i32 %1341, %1336
  %1343 = add i32 %1342, %1342
  %1344 = add i32 %1341, %1336
  %1345 = sub i32 %1344, %1343
  %1346 = xor i32 %1341, %1336
  %1347 = trunc i32 %1345 to i8
  store i8 %1347, i8* %1339, align 1
  br label %1348

; <label>:1348                                    ; preds = %1331
  %1349 = load i32* %i, align 4
  %1350 = xor i32 %1349, 1
  %1351 = and i32 %1349, 1
  %1352 = add i32 %1351, %1351
  %1353 = add nsw i32 %1350, %1352
  %1354 = add nsw i32 %1349, 1
  store i32 %1353, i32* %i, align 4
  br label %1328

; <label>:1355                                    ; preds = %1328
  store i32 0, i32* %i, align 4
  br label %1356

; <label>:1356                                    ; preds = %1374, %1355
  %1357 = load i32* %i, align 4
  %1358 = icmp slt i32 %1357, 4
  br i1 %1358, label %1359, label %1381

; <label>:1359                                    ; preds = %1356
  %1360 = load i32* %i, align 4
  %1361 = sext i32 %1360 to i64
  %1362 = getelementptr inbounds [4 x i8]* %ln, i32 0, i64 %1361
  %1363 = load i8* %1362, align 1
  %1364 = load i32* %i, align 4
  %1365 = sext i32 %1364 to i64
  %1366 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1365
  store i8 %1363, i8* %1366, align 1
  %1367 = load i32* %i, align 4
  %1368 = sext i32 %1367 to i64
  %1369 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1368
  %1370 = load i8* %1369, align 1
  %1371 = load i32* %i, align 4
  %1372 = sext i32 %1371 to i64
  %1373 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1372
  store i8 %1370, i8* %1373, align 1
  br label %1374

; <label>:1374                                    ; preds = %1359
  %1375 = load i32* %i, align 4
  %1376 = xor i32 %1375, 1
  %1377 = and i32 %1375, 1
  %1378 = add i32 %1377, %1377
  %1379 = add nsw i32 %1376, %1378
  %1380 = add nsw i32 %1375, 1
  store i32 %1379, i32* %i, align 4
  br label %1356

; <label>:1381                                    ; preds = %1356
  br label %1382

; <label>:1382                                    ; preds = %1381
  %1383 = load i32* %k, align 4
  %1384 = xor i32 %1383, 1
  %1385 = and i32 %1383, 1
  %1386 = add i32 %1385, %1385
  %1387 = add nsw i32 %1384, %1386
  %1388 = add nsw i32 %1383, 1
  store i32 %1387, i32* %k, align 4
  br label %117

; <label>:1389                                    ; preds = %117
  store i32 0, i32* %i, align 4
  br label %1390

; <label>:1390                                    ; preds = %1413, %1389
  %1391 = load i32* %i, align 4
  %1392 = icmp slt i32 %1391, 4
  br i1 %1392, label %1393, label %1420

; <label>:1393                                    ; preds = %1390
  %1394 = load i32* %i, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1395
  %1397 = load i8* %1396, align 1
  %1398 = load i32* %i, align 4
  %1399 = sext i32 %1398 to i64
  %1400 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1399
  store i8 %1397, i8* %1400, align 1
  %1401 = load i32* %i, align 4
  %1402 = sext i32 %1401 to i64
  %1403 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1402
  %1404 = load i8* %1403, align 1
  %1405 = load i32* %i, align 4
  %1406 = xor i32 4, %1405
  %1407 = and i32 4, %1405
  %1408 = add i32 %1407, %1407
  %1409 = add nsw i32 %1406, %1408
  %1410 = add nsw i32 4, %1405
  %1411 = sext i32 %1409 to i64
  %1412 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1411
  store i8 %1404, i8* %1412, align 1
  br label %1413

; <label>:1413                                    ; preds = %1393
  %1414 = load i32* %i, align 4
  %1415 = xor i32 %1414, 1
  %1416 = and i32 %1414, 1
  %1417 = add i32 %1416, %1416
  %1418 = add nsw i32 %1415, %1417
  %1419 = add nsw i32 %1414, 1
  store i32 %1418, i32* %i, align 4
  br label %1390

; <label>:1420                                    ; preds = %1390
  store i32 0, i32* %i, align 4
  br label %1421

; <label>:1421                                    ; preds = %1504, %1420
  %1422 = load i32* %i, align 4
  %1423 = icmp slt i32 %1422, 64
  br i1 %1423, label %1424, label %1511

; <label>:1424                                    ; preds = %1421
  %1425 = load i32* %i, align 4
  %1426 = sext i32 %1425 to i64
  %1427 = getelementptr inbounds [64 x i32]* @final_message_permutation, i32 0, i64 %1426
  %1428 = load i32* %1427, align 4
  store i32 %1428, i32* %shift_size, align 4
  %1429 = load i32* %shift_size, align 4
  %1430 = sub i32 0, 1
  %1431 = xor i32 %1429, %1430
  %1432 = and i32 %1429, %1430
  %1433 = add i32 %1432, %1432
  %1434 = add nsw i32 %1431, %1433
  %1435 = sub nsw i32 %1429, 1
  %1436 = srem i32 %1434, 8
  %1437 = ashr i32 128, %1436
  %1438 = trunc i32 %1437 to i8
  store i8 %1438, i8* %shift_byte, align 1
  %1439 = load i32* %shift_size, align 4
  %1440 = sub i32 0, 1
  %1441 = xor i32 %1439, %1440
  %1442 = and i32 %1439, %1440
  %1443 = add i32 %1442, %1442
  %1444 = add nsw i32 %1441, %1443
  %1445 = sub nsw i32 %1439, 1
  %1446 = sdiv i32 %1444, 8
  %1447 = sext i32 %1446 to i64
  %1448 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1447
  %1449 = load i8* %1448, align 1
  %1450 = zext i8 %1449 to i32
  %1451 = load i8* %shift_byte, align 1
  %1452 = zext i8 %1451 to i32
  %1453 = xor i32 1024725801, -1
  %1454 = or i32 %1452, 1024725801
  %1455 = or i32 %1450, 1024725801
  %1456 = or i32 %1452, %1453
  %1457 = or i32 %1450, %1453
  %1458 = and i32 %1454, %1455
  %1459 = and i32 %1458, %1456
  %1460 = and i32 %1459, %1457
  %1461 = and i32 %1452, %1450
  %1462 = trunc i32 %1460 to i8
  store i8 %1462, i8* %shift_byte, align 1
  %1463 = load i32* %shift_size, align 4
  %1464 = sub i32 0, 1
  %1465 = xor i32 %1463, %1464
  %1466 = and i32 %1463, %1464
  %1467 = add i32 %1466, %1466
  %1468 = add nsw i32 %1465, %1467
  %1469 = sub nsw i32 %1463, 1
  %1470 = srem i32 %1468, 8
  %1471 = load i8* %shift_byte, align 1
  %1472 = zext i8 %1471 to i32
  %1473 = shl i32 %1472, %1470
  %1474 = trunc i32 %1473 to i8
  store i8 %1474, i8* %shift_byte, align 1
  %1475 = load i8* %shift_byte, align 1
  %1476 = zext i8 %1475 to i32
  %1477 = load i32* %i, align 4
  %1478 = srem i32 %1477, 8
  %1479 = ashr i32 %1476, %1478
  %1480 = load i32* %i, align 4
  %1481 = sdiv i32 %1480, 8
  %1482 = sext i32 %1481 to i64
  %1483 = load i8** %2, align 8
  %1484 = getelementptr inbounds i8* %1483, i64 %1482
  %1485 = load i8* %1484, align 1
  %1486 = zext i8 %1485 to i32
  %1487 = xor i32 %1486, -1
  %1488 = xor i32 %1479, -1
  %1489 = xor i32 -414741809, -1
  %1490 = and i32 %1487, -414741809
  %1491 = and i32 %1486, %1489
  %1492 = and i32 %1488, -414741809
  %1493 = and i32 %1479, %1489
  %1494 = or i32 %1490, %1491
  %1495 = or i32 %1492, %1493
  %1496 = xor i32 %1494, %1495
  %1497 = or i32 %1487, %1488
  %1498 = xor i32 %1497, -1
  %1499 = or i32 -414741809, %1489
  %1500 = and i32 %1498, %1499
  %1501 = or i32 %1496, %1500
  %1502 = or i32 %1486, %1479
  %1503 = trunc i32 %1501 to i8
  store i8 %1503, i8* %1484, align 1
  br label %1504

; <label>:1504                                    ; preds = %1424
  %1505 = load i32* %i, align 4
  %1506 = xor i32 %1505, 1
  %1507 = and i32 %1505, 1
  %1508 = add i32 %1507, %1507
  %1509 = add nsw i32 %1506, %1508
  %1510 = add nsw i32 %1505, 1
  store i32 %1509, i32* %i, align 4
  br label %1421

; <label>:1511                                    ; preds = %1421
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Obfuscator-LLVM clang version 3.6.1 (tags/RELEASE_361/final) (based on Obfuscator-LLVM 3.6.1)"}
