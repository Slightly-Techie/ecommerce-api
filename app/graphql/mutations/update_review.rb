module Mutations
  class UpdateReview < BaseMutation
    argument :product_id, ID, required: true
    argument :rating, Float, required: true
    argument :comment, String, required: false

    field :success, Boolean, null: false
    field :comment,String,null:true

    def resolve(product_id:, rating:, comment: nil)

      review = current_user.reviews.find_by(product_id: product_id)

      if review
        if review&.update(rating: rating, comment: comment)
          respond 200, success: true, comment: review.comment
        else
          respond 422, success: false, errors: review.errors.full_messages
        end
      else
        respond 404, success: false, errors: ["Product review not found"]
      end
    end
  end
end
