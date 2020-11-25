//Maximum Subarray
//
//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//
//Example 1:
//
//Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Example 2:
//
//Input: nums = [1]
//Output: 1
//Example 3:
//
//Input: nums = [0]
//Output: 0
//Example 4:
//
//Input: nums = [-1]
//Output: -1
//Example 5:
//
//Input: nums = [-2147483647]
//Output: -2147483647


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        if nums.isEmpty {
            return 0
        }
        var max : Int = nums.first!
        var tempSum :Int =  0
        var finalSum : Int = 0
        for item in nums {
            if max < item {
                max = item
            }
            tempSum += item
            if tempSum > finalSum  {
                finalSum = tempSum
            }
            if tempSum < 0 {
                tempSum = 0
            }
        }
        
        return finalSum == 0 ? max : finalSum
    }
}
